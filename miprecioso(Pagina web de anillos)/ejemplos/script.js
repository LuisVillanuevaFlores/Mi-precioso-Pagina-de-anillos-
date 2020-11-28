

function enviar_datos_ajax() {
    var n = document.getElementById("nombre");
    var ap = document.getElementById("apaterno");
    var am = document.getElementById("amaterno");
    
    var url = "procesar_datos.php";
    
    $.ajax({
        type:"post",
        url:url,
        data:{nombre:n,apaterno:ap,amaterno:am},
        success:function(datos){
            $("#mostrardatos").html(datos);
        }
    }
    
    )
}



