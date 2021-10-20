function createWorker() {
    const workerBolb = new Blob([WORKER_STRING], {
        type: 'application/javascript'
    });

    const workerURL = URL.createObjectURL(workerBolb);

    const captureWorker = new Worker(workerURL);

    return captureWorker;
}

const captureWorker = createWorker();

const noop = function () { };

const webCapture = {
    callback: null,
    error: null,
    capture(file, timeStamp, callback = noop, error = noop) {
        this.callback = callback;
        this.error = error
        captureWorker.postMessage({
            type: 'capture',
            data: {
                file,
                timeStamp: timeStamp
            }
        });
    }
};

captureWorker.onmessage = function (evt) {
    if (evt.data.type == 'capture') {
        try {
            const { imageDataBuffer, width, height } = evt.data.data;

            let canvas = document.createElement('canvas');
            let ctx = canvas.getContext('2d');

            canvas.width = width;
            canvas.height = height;

            const imageData = new ImageData(imageDataBuffer, width, height);
            ctx.putImageData(imageData, 0, 0, 0, 0, width, height);

            webCapture.callback(canvas.toDataURL('image/jpeg'), evt.data.data);
        } catch (error) {
            webCapture.error(error);
        }
    }
};

window.webCapture = webCapture;

export default webCapture;
