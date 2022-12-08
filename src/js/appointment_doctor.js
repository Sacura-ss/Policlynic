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
                <a href="#" onClick="removeAppointment(${app.idAppointment})">Удалить</a>
                <a href="#" onClick="selectAppointment('${app.idAppointment}', '${app.symptoms}',
                '${app.prescribedDrugs}')">Редактировать</a>
            </div> 
        </div>`
    })
}

let selected_id = null;
function selectAppointment(id, symptoms, prescribedDrugs) {
    selected_id = id;
    document.getElementById('symptoms-edit').value = symptoms;
    document.getElementById('prescribedDrugs-edit').value = prescribedDrugs;
}

async function updateAppointment() {
    const symptoms = document.getElementById('symptoms-edit').value,
        prescribedDrugs = document.getElementById('prescribedDrugs-edit').value,
        diagnosis = document.getElementById('diagnosis-edit').value,
        statusAp = document.getElementById('status-edit').value;

    // PATCH не поддерживает form data как post => используем json
    const data = {
        diagnosis: diagnosis,
        symptoms: symptoms,
        drugs: prescribedDrugs,
        status: statusAp
    };
    const res = await fetch(`http://localhost:8000/appointment/${selected_id}`, {
        method: `PATCH`,
        body: JSON.stringify(data)
    });

    let resData = res.json();

    getAppointments();
    if (resData.status === true) {
        await getAppointments();
    }

}

async function removeAppointment(id) {
    const res = await fetch(`http://localhost:8000/appointment/${id}`, {
        method: "DELETE"
    });

    const data = await res.json();

    if(data.status === true) {
        await getAppointments();
    }
}

getAppointments();