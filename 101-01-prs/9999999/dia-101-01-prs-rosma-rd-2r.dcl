///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_press_sens_rosma_rd_2r: dialog {label = "РД-2Р";

:row {label="";
  :column {label="";
    :text {label="Диапазон,";}
    :text {label="МПа";}
    :list_box {key="txt-01"; list=""; width=20; height=10; value=0;}//list_box
  }//column

  :column {label="";  
  	:text {label="Дифференциал,";}
    :text {label="МПа";}
    :list_box {key="txt-02"; list=""; width=20; height=10; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Описание";}
    :text {label="";}
    :list_box {key="txt-1001"; list=""; width=80; height=10; value=0;}//list_box
  }//column 
}//row

:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
