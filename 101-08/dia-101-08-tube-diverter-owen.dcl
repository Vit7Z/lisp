///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_tube_diverter_owen: dialog {label = "Трубка отводная \"Овен\"";

:row {label="";
  :column {
    :text {label="Модификация";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=15; height=8; value=0;}//list_box
  }//column

  :column {
    :text {label="Геометрия";}
    :text {label="трубки";}
    :list_box {key="txt-02"; list=""; width=20; height=8; value=0;}//list_box
  }//column

  :column {
    :text {label="Присоединение к";}
    :text {label="процессу";}
    :list_box {key="txt-03"; list=""; width=20; height=8; value=0;}//list_box
  }//column

  :column {
    :text {label="Присоединение к";}
    :text {label="прибору";}
    :list_box {key="txt-04"; list=""; width=20; height=8; value=0;}//list_box
  }//column

  :column {
    :text {label="Материал";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=20; height=8; value=0;}//list_box
  }//column

  :column {
    :text {label="Длина,";}
    :text {label="см";}
    :list_box {key="txt-06"; list=""; width=20; height=8; value=0;}//list_box
  }//column

}//row


:row {label="";
	:column {
		:text {label="Описание";}
		:list_box {label=""; key="txt-1001"; list=""; height=4; width=50; value= "";}
  }//column
}//row


:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; height=10; value= "0";}
}//column


:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
