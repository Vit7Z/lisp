///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_mrtg_dsgn_pressure: dialog {label = "ЗК давления";

:row {label=""; 
  :column {label="";
    :text {label="№ чертежа ЗК";}
    :text {label="";}
    :list_box {key="txt-01"; width=15; list=""; height=10;}//list_box
  }//column  

	:column {label="";
		:text {label="Назначение";}
   	:text {label="";}
   	:list_box {key="txt-02"; width=30; height=10;}//list_box
  }//column
  
  :column {label="";
    :text {label="Обозначение ЗК";}
    :text {label="";}
    :list_box {key="txt-05"; width=40; height=10;}//list_box
  }//column

  :column {label="";
    :text {label="Ру,";}
    :text {label="МПа";}
    :list_box {key="txt-03"; height=10;}//list_box
  }//column
    
  :column {label="";
  	:text {label="Т, °С";}
    :text {label="";}
    :list_box {key="txt-04"; height=10;}//list_box
  }//column
  
  :column {label="";
    :text {label="Клапан";}
    :text {label="";}
    :list_box {key="txt-06"; width=30; height=10;}//list_box
  }//column

  :column {label="";
  	:text {label="Патрубок";}
  	:text {label="";}
    :list_box {key="txt-07"; width=30; height=10;}//list_box
  }//column

  :column {label="";
  	:text {label="Присоединение";}
  	:text {label="";}
    :list_box {key="txt-08"; width=30; height=10;}//list_box
  }//column
}//row

:row {label=""; 
	:column {label="";
  		:text {label="Полное наименование / Описание";}
    	:list_box {key="txt-900"; width=30; height=6;}//list_box
  }//column
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; width=34; height=7; value= "0";}
}//column 

:row {label="";
	:button {label="Выбрать"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////

