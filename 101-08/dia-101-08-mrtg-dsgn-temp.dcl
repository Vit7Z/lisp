///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_mrtg_dsgn_temp: dialog {label = "ЗК температура";

:row {label="";
  :column {label="";
    :text {label="№ чертежа ЗК";}
    :text {label="";}
    :list_box {key="txt-01"; width=20; list=""; height=10;}//list_box
  }//column  

  :column {label="";
  	:text {label="Назначение (описание)";}
    :text {label="";}
    :list_box {key="txt-02"; width=50; height=10; is_enabled=false;}//list_box
  }//column

  :column {label="";
    :text {label="Ру,";}
    :text {label="МПа";}
    :list_box {key="txt-03"; height=10;}//list_box
  }//column
    
  :column {label="";
  	:text {key="l-04-1"; label="Т среды,";}
    :text {key="l-04-2"; label="С";}
    :list_box {key="txt-04"; height=10;}//list_box
  }//column
  
  :column {label="";
    :text {label="Присоединение";}
    :text {label="";}
    :list_box {key="txt-05"; height=10;}//list_box
  }//column

  :column {label="";
    :text {key="l-06-1"; label="Материал";}
    :text {key="l-06-2"; label="";}
    :list_box {key="txt-06"; width=25; height=10;}//list_box
  }//column

  :column {label="";
    :text {label="Исполнение";}
    :text {label="присоединения";}
    :list_box {key="txt-07"; width=30; height=10;}//list_box
  }//column 
  
  :column {label="";
    :text {key="l-08-1"; label="Тип присоединения";}
    :text {key="l-08-2"; label="";}
    :list_box {key="txt-08"; width=20; height=10;}//list_box
  }//column   
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; width=34; height=10; value= "0";}
}//column 

:row {label="";
	:button {label="Выбрать"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ПЭ ТХ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////

