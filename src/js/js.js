function parse_input() {
    var select = document.getElementById("user_type");
    let val = select.value;
    console.log(val);
    if(val === "doctor") {
        $('#inputArea').append('<label id="l_speciality"  name="l_speciality">Специальность</label>');
        $('#inputArea').append('<select id="s_speciality" name="s_speciality"></select>');
        $('#inputArea').append('<label id="l_category" name="l_category">Категория</label>');
        $('#inputArea').append('<select id="s_category" name="s_category"></select>');

    }
    else {
        $('#l_speciality').remove();
        $('#s_speciality').remove();
        $('#l_category').remove();
        $('#s_category').remove();
    }
    if(val === "patient") {
        $('#inputArea').append('<label id="l_date"  name="l_date">Дата рождения ГГГГ-ММ-ДД</label>');
        $('#inputArea').append('<input type="text" id="i_date"  name="i_date" placeholder="Введите дату рождения">');
        $('#inputArea').append('<label id="l_address"  name="l_address">Адрес</label>');
        $('#inputArea').append('<input type="text" id="i_address" name="i_address" placeholder="Введите адрес">');
        $('#inputArea').append('<label id="l_policy"  name="l_policy">Медицинский полис</label>');
        $('#inputArea').append('<input type="text" id="i_policy"  name="i_policy" placeholder="Введите номер медицинского полиса">');

    }
    else {
        $('#l_date').remove();
        $('#i_date').remove();
        $('#l_address').remove();
        $('#i_address').remove();
        $('#l_policy').remove();
        $('#i_policy').remove();
    }
    if (val === "none") {
        $('#inputArea').innerHTML = "";
    }
}