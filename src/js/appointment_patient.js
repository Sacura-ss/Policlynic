async function getAppointments() {
    let res = await fetch('http://localhost:8000/appointment');
    let appointments = await res.json();

    document.querySelector('.cards_wrap').innerHTML = '';

    appointments.forEach((app) => {
        document.querySelector('.cards_wrap').innerHTML +=

            `<div class="card_item"> 
            <div class="card_inner"> 
                <div class="sea_name"> ${app.surname} </div> 
                <div class="date">${app.appointmentType}</div> 
                <div class="date">${app.shortDate}</div>
                <div class="date">${app.time}</div>
                <div class="date">${app.cabinet}</div>
                <div class="date">${app.nameDiagnosis}</div>
                <div class="date">${app.symptoms}</div>
                <div class="date">${app.prescribedDrugs}</div>
                <div class="date">${app.nameAppointmentStatus}</div>
            </div> 
        </div>`
    })
}

async function addAppointment() {
    const doctor = document.getElementById('doctors-edit').value,
        type = document.getElementById('type-edit').value;

    let formData = new FormData();
    formData.append(`doctor`, doctor);
    formData.append(`type`, type);

    const res = await fetch('http://localhost:8000/appointment', {
        method: `POST`,
        body: formData
    });

    const data = await res.json();

    if (data.status === true) {
        await getAppointments();
    }

}
getAppointments();