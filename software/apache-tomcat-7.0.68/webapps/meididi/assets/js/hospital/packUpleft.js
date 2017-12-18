window.onload=function()
	{
		var oBtn=document.getElementById("btnLeft");
		var oList=document.getElementById("meiddLeft");
		var oMinRight=document.getElementById("meiddRight");
		$(oBtn).on('click',function()
		{
			if(oList.style.display=="none")
			{
				oList.style.display="block";
				this.style.left=null;
				oMinRight.style.marginLeft="268px";
				this.style.backgroundImage="url(../assets/images/hospital/btn_meidd_out.png)";
                $.cookie('leftClose', '1');  
			}
			else
			{
				oList.style.display="none";
				this.style.left=0;
				oMinRight.style.marginLeft="30px";
				this.style.backgroundImage="url(../assets/images/hospital/btn_meidd_up.png)";
                $.cookie('leftClose', '0'); 
			}
		});
	};