function parse_input() {
    var select = document.getElementById("user_type");
    let val = select.value;
    console.log(val);
    if (val === "none") {
        document.getElementById('inputArea').style.display = 'none';
    }
    else {
        document.getElementById('inputArea').style.display = 'block';
    }
    if(val === "doctor") {
        document.getElementById('l_speciality').style.display = 'block';
        document.getElementById('s_speciality').style.display = 'block';
        document.getElementById('l_category').style.display = 'block';
        document.getElementById('s_category').style.display = 'block';
    }
    else {
        document.getElementById('l_speciality').style.display = 'none';
        document.getElementById('s_speciality').style.display = 'none';
        document.getElementById('l_category').style.display = 'none';
        document.getElementById('s_category').style.display = 'none';
    }
    if(val === "patient") {
        document.getElementById('l_date').style.display = 'block';
        document.getElementById('i_date').style.display = 'block';
        document.getElementById('l_address').style.display = 'block';
        document.getElementById('i_address').style.display = 'block';
        document.getElementById('l_policy').style.display = 'block';
        document.getElementById('i_policy').style.display = 'block';

    }
    else {
        document.getElementById('l_date').style.display = 'none';
        document.getElementById('i_date').style.display = 'none';
        document.getElementById('l_address').style.display = 'none';
        document.getElementById('i_address').style.display = 'none';
        document.getElementById('l_policy').style.display = 'none';
        document.getElementById('i_policy').style.display = 'none';
    }
}