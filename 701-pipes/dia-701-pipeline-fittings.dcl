dia_701_pipeline_fittings: dialog {label = "Задвижки";

:row {label=""; 
  :column {label="";
    :text {key="txt-01-1"; label="Модель";}
    :text {key="txt-01-2"; label="";}
    :list_box {key="txt-01"; width=20; list=""; height=20;}//list_box
  }//column  

  :column {label="";
  	:text {key="txt-02-1"; label="Описание";}
    :text {key="txt-02-2"; label="";}
    :list_box {key="txt-02"; width=50; height=20;}//list_box
  }//column

  :column {label="";
    :text {key="txt-03-1"; label="Ру,";}
    :text {key="txt-03-2"; label="МПа";}
    :list_box {key="txt-03"; height=20;}//list_box
  }//column
    
  :column {label="";
  	:text {key="txt-04-1"; label="Ду,";}
    :text {key="txt-04-2"; label="мм";}
    :list_box {key="txt-04"; height=20;}//list_box
  }//column

  :column {label="";
    :text {key="txt-06-1"; label="Масса,";}
    :text {label="кг";} 
    :list_box {key="txt-06"; width=20; height=20;}//list_box
  }//column 
}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; width=34; height=10; value= "0";}
}//column 

:row {label="";
	:button {label="Выбрать"; key="but1"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ПЭ ТХ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////

