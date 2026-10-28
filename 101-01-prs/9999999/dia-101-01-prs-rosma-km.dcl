///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_press_sens_rosma_km: dialog {label = "Манометры \"РОСМА\"";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=20; height=12; value=0;}//list_box
  }//column

  :column {label="";  
  	:text {label="Диаметр";}
    :text {label="корпуса";}
    :list_box {key="txt-02"; list=""; width=15; height=12; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Материал";}
    :text {label="корпуса";}
    :list_box {key="txt-03"; list=""; width=15; height=12; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Расположение";}
    :text {label="штуцера";}
    :list_box {key="txt-04"; list=""; width=15; height=12; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Ед.";}
    :text {label="изм.";}
    :list_box {key="txt-05"; list=""; width=15; height=12; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Пределы ";}
    :text {label="изм.";}
    :list_box {key="txt-06"; list=""; width=15; height=12; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Резьба";}
    :text {label="присоединения";}
    :list_box {key="txt-07"; list=""; width=15; height=12; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Класс";}
    :text {label="точности";}
    :list_box {key="txt-08"; list=""; width=15; height=12; value=0;}//list_box
  }//column
}//row


:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row

:row {label="";
	:column {
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=18; height=8; value= "0";}
	}//column
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
