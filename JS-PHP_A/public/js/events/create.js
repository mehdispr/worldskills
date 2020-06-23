let sessionLength = 1;

$('#add-session').click(() => {
    $('tbody').append(`
    <tr class="session">
        <td>
            <input class="form-control" type="text" name="sessions[${ sessionLength }][title]" required>
        </td>
        <td>
            <input class="form-control" type="text" name="sessions[${ sessionLength }][time]" required>
        </td>
        <td>
            <input class="form-control" type="text" name="sessions[${ sessionLength }][room]" required>
        </td>
        <td>
            <input class="form-control" type="text" name="sessions[${ sessionLength }][speaker]" required>
        </td>
        <td>
            <button class="btn btn-danger btn-delete-session">&times;</button>
        </td>
    </tr>
    `);

    sessionLength++;
});

$(document).on('click', '.btn-delete-session', event => {
    event.preventDefault();
    $(event.target).parent().parent().remove();
});