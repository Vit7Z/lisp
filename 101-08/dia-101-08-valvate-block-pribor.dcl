///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_klapanny_block_pribor: dialog {label = "Клапанные блоки \"Прибор\"";

:row {label="";
  :column {
    :text {label="Серия";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=30; height=8; value=0;}//list_box
  }//column

  :column {
    :text {label="Кол.";}
    :text {label="вентилей";}
    :list_box {key="txt-02"; list=""; width=10; height=8; value=0;}//list_box
  }//column

  :column {
    :text {label="Гидравлическая схема,";}
    :text {label="код (расшифровка)";}
    :list_box {key="txt-03"; list=""; width=60; height=8; value=0;}//list_box
  }//column

  :column {
    :text {label="Материал корпуса"; key="lbl-041";}
    :text {label="код (расшифровка)"; key="lbl-042";}
    :list_box {key="txt-04"; list=""; width=20; height=8; value=0;}//list_box
  }//column

  :column {
    :text {label="Спец. исполнение"; key="lbl-051";}
    :text {label="код (расшифровка)"; key="lbl-052";}
    :list_box {key="txt-05"; list=""; width=25; height=8; value=0;}//list_box
  }//column

  :column {
    :text {label="Технические"; key="lbl-091";}
    :text {label="условия"; key="lbl-092";}
    :list_box {key="txt-09"; list=""; width=20; height=8; value=0; is_enabled=false;}//list_box
  }//column

}//row

:row {label="";
	:text {label=""; key="ptxt-01"; height=2; value="Предназначены для присоединения импульсных линий к клапанному блоку через монтажные фланцы";}
}//row

:row {label="";
  :column {
  	:text {label="Монтажные части, код (расшифровка)"; key="lbl-061";}
    :text {label="";}
    :list_box {key="txt-06"; width=80; height=8; value=0;}//list_box
  }//column

  :column {
  	:text {label="Монтажные части для крепления"; key="lbl-071";}
    :text {label="блока на трубе, код (расшифровка)"; key="lbl-072";}
    :list_box {key="txt-07"; width=45; height=8; value=0;}//list_box
  }//column

  :column {
  	:text {label="Монтажные части для крепления"; key="lbl-081";}
    :text {label="датчика на трубе, код (расшифровка)"; key="lbl-082";}
    :list_box {key="txt-08"; width=45; height=8; value=0;}//list_box
  }//column

  :column {
    :text {label=""; key="lbl-101";}
    :text {label=""; key="lbl-102";}
    :list_box {key="txt-10"; list=""; width=20; height=8; value=0; is_enabled=false;}//list_box
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
