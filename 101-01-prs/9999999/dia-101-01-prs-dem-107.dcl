///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_dem_102: dialog {label = "Датчик-реле давления ДЕМ 107";

:row {label="";
  :column {label="";  
  	:text {label="Описание";}
    :list_box {key="txt-1001"; list=""; width=60; height=15; value=0;}//list_box
  }//column
}//row

:row {label=""; height=1;  
}//row

:row {label="";
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row

}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
