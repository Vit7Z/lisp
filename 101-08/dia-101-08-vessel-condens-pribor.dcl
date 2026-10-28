///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_vessel_condens_pribor: dialog {label = "Сосуды конденсационные, уравнительные";

:row {label="";
  :column {label="Тип сосуда";
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-10"; list=""; width=40; height=7; value=0;}//list_box
  }//column

  :column {label="Давление,";
    :text {label=" МПа";}
    :text {label="";}
    :list_box {key="txt-11"; list=""; width=8; height=7; value=0;}//list_box
  }//column
  
  :column {label="Исполнение";
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-12"; list=""; width=8; height=7; value=0;}//list_box
  }//column 

  :column {label="Материал";
    :text {label=" сосуда";}
    :text {label="";}
    :list_box {key="txt-13"; list=""; width=18; height=7; value=0;}//list_box
  }//column

	:column {label="";
		:text {label="Выбрано"; }//text
		:text {label=""; }//text
		:text {label=""; }//text
		:list_box {label=""; key="txt-101"; list=""; width=60; height=7; value= "0";}
	}//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
