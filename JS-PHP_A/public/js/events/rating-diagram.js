let bad = parseInt($('#bad').val());
let average = parseInt($('#average').val());
let excellent = parseInt($('#bad').val());

new Chart('reportDiagram', {
    type: 'pie',
    data: {
        labels: [
            'Bad',
            'Average',
            'Excellent',
        ],
        datasets: [
            {
                data: [
                    bad,
                    average,
                    excellent,
                ],
                backgroundColor: [
                    '#ff3333',
                    '#ffff33',
                    '#33ff33',
                ],
            }
        ],
    },
    options: {
        tooltips: {
            callbacks: {
                label: function (toolTipItem, data) {
                    let currentValue = data.datasets[0].data[toolTipItem.index];
                    let percentage = currentValue / (bad + average + excellent) * 100 + '%';

                    return toolTipItem.index + ': ' + percentage;
                },
            },
        },
    },
});