///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_danfoss_fqs_u30g: dialog {label = "";

:row {label=""; 
  :column {label=""; 
    :text {label="Диаметр";}
    :text {label="трубопровода,";}
    :text {label="мм (\")";}
    :list_box {key="txt-01"; width=15; height=7;}//list_box
  }//column

  :column {label="";
		:text {label="Диапазон";}
		:text {label="уменьшения";}
		:text {label="расхода, м3/ч";}
		:list_box {key="txt-02"; width=15; height=7;}
	}//column

	:column {label="";
		:text {label="Диапазон";}
		:text {label="увеличения";}
		:text {label="расхода, м3/ч";}
    :list_box {key="txt-03"; width=12; height=7;}//list_box
  }//column

	:column {label="";
		:text {label="Набор лепестков";}
		:text {label="";}
    :text {label="";}
    :list_box {key="txt-04"; width=24; height=7;}//list_box  
  }//column

	:column {label="";
		:text {label="Описание";}
		:text {label="";}
    :text {label="";}
    :list_box {key="txt-1001"; width=60; height=7;}//list_box  
  }//column
}//row

:row {label=""; height=1;}

:column {label="";
	:text {label="Выбрано";}
	:list_box {key="txt-901"; width=20; height=9;}
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
