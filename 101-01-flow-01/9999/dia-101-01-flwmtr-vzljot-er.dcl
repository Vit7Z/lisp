///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_dia_101_01_flwmtr_vzljot_er: dialog {label = "ВЗЛЕТ ЭР";

:row {label=""; children_alignment=top;
	:column {
		:text {label="Исполнение";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=35; height=14; value=0;}//list_box
  }//column

    :column { 
      :text {label="Ду, мм";}
      :text {label="";}
      :list_box {label=""; key="txt-02"; list=""; width=10; height=14; value= "0";}
    }//column

    :column { 
    	:text {label="Пределы";}
    	:text {label="изм, м3/ч";}
      :list_box {label=""; key="txt-03"; list=""; width=20; height=14; value= "0";}
    }//column

    :column { 
    	:text {label="Масса,";}
    	:text {label="кг";}
      :list_box {label=""; key="txt-99"; list=""; width=20; height=14; value= "0";}
    }//column

}//row


:row {label="";
  :column {label="";
    :text {label="Описание";}
    :list_box {key="txt-1001"; list=""; width=70; height=10; value=0;}//list_box
  }//column
}//row


:row {label="";
	:column {
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=18; height=8; value= "0";}
	}//column
}//row

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
