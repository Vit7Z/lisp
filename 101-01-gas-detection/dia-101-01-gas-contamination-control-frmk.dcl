///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_gs_frmk: dialog {label = "Газоанализаторы";

:row {label=""; 
  :column {label="";
    :text {label="Модель"; key="ptxt-011";}
    :text {label=""; key="ptxt-012";}
    :list_box {key="txt-01"; list=""; width=20; height=5; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Контролируемые"; key="ptxt-021";}
    :text {label="газы"; key="ptxt-022";}
    :list_box {key="txt-02"; list=""; width=20; height=5; value=0; multiple_select=true; }//list_box
  }//column

  :column {label="";
    :text {label="Дополнительное"; key="ptxt-031";}
    :text {label="описание"; key="ptxt-032";}
    :list_box {key="txt-03"; list=""; width=40; height=5; value=0; is_enabled=falshe;}//list_box
  }//column

  :column {label="";
    :text {label="Производитель";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=34; height=5; value=0; is_enabled=falshe;}//list_box
  }//column  
}//row

:row {label="";
	:column {label="";
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=50; height=7; value= "0";}
	}//column
}//row

:row {label="";
	:column {label="";
		:text_part {label=""; key="ptxt-801";}
		:text_part {label=""; key="ptxt-802";}
		:text_part {label=""; key="ptxt-803";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
