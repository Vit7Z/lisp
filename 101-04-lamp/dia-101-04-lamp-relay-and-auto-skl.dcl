///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_04_lamp_relay_and_auto_skl
: dialog {label = "";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Группа";}
    :text {label="яркости";}
    :list_box {key="txt-02"; list=""; width=20; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Цвет свечения";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=20; height=10; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Цвет линзы";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=20; height=10; value=0;}//list_box
  }//column  

  :column {label="";
    :text {label="Род тока";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=20; height=10; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Напряжение,";}
    :text {label="В";}
    :list_box {key="txt-06"; list=""; width=20; height=10; value=0;}//list_box
  }//column
}//row

:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=10; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
