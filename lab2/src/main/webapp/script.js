let xFlag=false;
let yFlag=false;
let rFlag=false;

let xValues = ["-2","-1.5","-1","-0.5","0","0","1","1.5","2"];
let rValues = ["1","1.5","2","2.5","3"];

function selectDefaultR() {
    try {
        let r = Number(document.getElementById("finalTable").rows[1].cells[2].innerHTML);
        $("input[name='r'][value='" + r + "']").click();
    } catch(e){}
}

function drawPoints(r){
    let currentPoints = [];
    let tableRows = document.getElementById("finalTable").rows;
    for (let i=1;i<tableRows.length;i++){
        if (Number(r)===Number(tableRows[i].cells[2].innerHTML)) currentPoints.push(tableRows[i]);
    }
    let currentGraph = document.getElementById("finalGraph");
    $('.currentPoints').remove();
    for (let i=0; i<currentPoints.length;i++) {
        let currentColor = "";
        if (currentPoints[i].cells[3].innerHTML==="true") currentColor="green"; else currentColor="red";
        let x = 155+ Number(currentPoints[i].cells[0].innerHTML)*100/r;
        let y = 155- Number(currentPoints[i].cells[1].innerHTML)*100/r;
        let circle = document.createElementNS("http://www.w3.org/2000/svg","circle");
        circle.setAttribute("class","currentPoints");
        circle.setAttribute("cx",x);
        circle.setAttribute("cy",y);
        circle.setAttribute("fill",currentColor);
        circle.setAttribute("r","5");
        circle.setAttribute("stroke", "black");
        circle.setAttribute("stroke-width","1");
        currentGraph.appendChild(circle);
    }
}





function createRequestFromClick(event) {
    let r = document.forms["actionPanel"].elements["r"].value;
    if (r!=="") {
        let t = event.target.closest(".graph");
        let rect = t.getBoundingClientRect();
        let x = ((event.x - rect.left) - 155) * r / 100;
        let y = (155 - (event.y - rect.top)) * r / 100;
        if (x<-2||x>2||y>=5||y<=-5) {
            alert("Выход за область определения x или y");
            return;
        }
        document.forms["actionPanel"].elements["r"].value=r;
        document.forms["actionPanel"].elements["xFinal"].value=x;
        document.forms["actionPanel"].elements["yFinal"].value=y;
        document.forms["actionPanel"].submit();
    } else alert("А как же R? :c")

}



function getX(form){
    return form.elements["x"].value;
}

function getY(form){
    let y = form.elements["y"].value;
    if (y[0]==="-") y = y.substring(0,8); else y = y.substring(0,7);
    return y;
}

function getR(form){
    return form.elements["r"].value;
}

function checkX(x){
    if ((x==='') || (xValues.indexOf(x)===-1)) xFlag=false;
    else xFlag=true;
}

function checkY(y){
    if (y==='') yFlag=false;
    else if(y>-5&&y<5) yFlag=true;
}

function checkR(r){
    if (r.length===0){ rFlag=false; return;}
    if (rValues.indexOf(r)===-1){ rFlag=false; return;}
    rFlag=true;
}


function clearData(){
    document.forms["clearDataForm"].submit();
}


function createRequest(id){
    let form = document.forms[id];

    let x = getX(form);
    let y = getY(form);
    let r = getR(form);

    xFlag=false;
    yFlag=false;
    rFlag=false;
    checkX(x);
    checkY(y);
    checkR(r);
    if (!xFlag) document.getElementById('alertX').innerHTML='Не выбрано значение X'; else document.getElementById('alertX').innerHTML=null;
    if (!yFlag) document.getElementById('alertY').innerHTML='Введено недопустимое значение Y'; else document.getElementById('alertY').innerHTML=null;
    if (!rFlag) document.getElementById('alertR').innerHTML='Не выбрано значение R'; else document.getElementById('alertR').innerHTML=null;

    if (!rFlag || !yFlag || !xFlag) {
        return;
    }

    form.elements["xFinal"].value = x;
    form.elements["yFinal"].value = y;

    form.submit();

}