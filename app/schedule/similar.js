module.exports = app => {
    return {
        schedule: {
            interval: '10s',   
            type: 'all',
            disable: true
        },
        async task(ctx) {
            console.log(1);
            const res = ctx;
        }
    }
}