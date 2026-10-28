///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_valvate_block_elemer: dialog {label = "Клапанные блоки \"Элемер\"";

:row {label="";
  :column {
    :text {label="Серия";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=7; value=0;}//list_box
  }//column

  :column {
    :text {label="Кол.";}
    :text {label="вентилей";}
    :list_box {key="txt-02"; list=""; width=10; height=7; value=0;}//list_box
  }//column

  :column {
    :text {label="Конструктивное исполнение,";}
    :text {label="Гидравлическая схема";}
    :list_box {key="txt-03"; list=""; width=120; height=7; value=0;}//list_box
  }//column

  :column {
    :text {label="Материал корпуса";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=40; height=7; value=0;}//list_box
  }//column
}//row

:row {label="";
	:text {label=""; key="ptxt-01"; height=2; value="";}
}//row

:row {label="";


  :column {
    :text {label="Соединение на входе среды";}
    :popup_list {key="txt-05"; list=""; width=40; height=8; value=0;}//list_box
  }//column

  :column {
  	:text {label="Исполнение";}
    :popup_list {key="txt-06"; width=30; height=8; value=0;}//list_box
  }//column
}//row

:row {label="";
  :column {
  	:text {label="Монтажный комплект (МК) для крепления к датчику давления";}
    :popup_list {key="txt-07"; width=120; height=8; value=0;}//list_box
  }//column
}//row

:row {label="";
  :column {
  	:text {label="Комплект монтажных частей (КМЧ) для присоединения к процессу";}
    :popup_list {key="txt-08"; width=30; height=8; value=0;}//list_box
  }//column

}//row

:row {label="";
  :column {
  	:text {label="Кронштейн для крепления датчика давления или клапанного блока";}
    :popup_list {key="txt-09"; width=30; height=8; value=0;}//list_box
  }//column

}//row

:column {label="";
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; height=7; value= "0";}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
