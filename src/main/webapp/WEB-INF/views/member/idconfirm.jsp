<html>
<body>
<script type="text/javascript">
    window.onload = function(){
        var result = document.getElementById("memId").innerHTML;
        if(result == 0){
            document.getElementById("memId").innerHTML = "아이디 사용가능합니다.";
        }
        else{
            document.getElementById("memId").innerHTML = "아이디 중복가입되어 있습니다.";
        }

        document.getElementById("close").onclick = function(){
            window.opener.document.getElementById("here").innerHTML
                = document.getElementById("canID").innerHTML;
            close();
        }
    }
</script>
</body>
</html>

