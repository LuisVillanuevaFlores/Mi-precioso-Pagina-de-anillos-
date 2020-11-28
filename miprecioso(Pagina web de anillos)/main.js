
function iniciar() {
   
    var ep_1=document.getElementById('ep1');
    ep_1.addEventListener('click',presionEnlace,false);
    var ep_2=document.getElementById('ep2');
    ep_2.addEventListener('click',presionEnlace,false);
    var ep_3=document.getElementById('ep3');
    ep_3.addEventListener('click',presionEnlace,false); 
    
    $('.navegacion ul li a:first').addClass('active');
    $('section').hide();
    $('section:first').show();
    $('ul li a').click(function(){
        $('ul li a').removeClass('active');
        $('section').hide();
        $(this).addClass('active');
        var activeTab =$(this).attr('href');
        $(activeTab).show();
    });
    tama();
    
}
function tama(){
    var nav=document.getElementById('nav');
    var altura=nav.offsetTop;
    window.addEventListener('scroll',function(){
        if(window.pageYOffset>altura){
            nav.classList.add('fixed');
    }   else{
        nav.classList.remove('fixed');
        }
    })
   
    
}

function presionEnlace(e){
    e.preventDefault();
    var url=e.target.getAttribute('href');
    mostrarDatos(url);
}
var conexion1;
function mostrarDatos(url){
    conexion1=new XMLHttpRequest();
    conexion1.onreadystatechange = procesarEventos;
    conexion1.open("GET",url,true);
    conexion1.send();


}

function procesarEventos(){
    var detalles = document.getElementById("detalles");
    if(conexion1.readyState ==4){
        detalles.innerHTML = conexion1.responseText;
    }
    else{
    detalles.innerHTML='Cargando...';
    }
}

window.addEventListener('load',iniciar,false);

