///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_tempr_metran_02_tsp: dialog {label = "";

:row {label="";
  :column {
    :text {label="Модель";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=18; height=10; }//list_box
  }//column  

  :column {
    :text {label="Исполнение";}
    :text {label="защитной";}
    :text {label="арматуры";}
    :list_box {key="txt-02"; list=""; width=20; height=10; }//list_box
  }//column

  :column {
    :text {label="Материал";}
    :text {label="соединит.";}
    :text {label="головки";}
    :list_box {key="txt-03"; list=""; width=16; height=10; is_enabled=false;}//list_box
  }//column

  :column {
    :text {label="Диапазон";}
    :text {label="измер.,";}
    :text {label="С";}
    :list_box {key="txt-04"; list=""; width=12; height=10; }//list_box
  }//column  

  :column {
    :text {label="Класс";}
    :text {label="допуска";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=7; height=10; }//list_box
  }//column

  :column {
    :text {label="Схема";}
    :text {label="соедин.";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=7; height=10; }//list_box
  }//column

  :column {
    :text {label="Кол. ЧЭ";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-07"; list=""; width=7; height=10; }//list_box
  }//column

  :column {
    :text {label="Длина,";}
    :text {label="мм.";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; width=10; height=10; }//list_box
  }//column

  :column {
    :text {label="Материал";}
    :text {label="защитной";}
    :text {label="арматуры";}
    :list_box {key="txt-09"; list=""; width=16; height=10; }//list_box
  }//column

  :column {
    :text {label="Климатич.";}
    :text {label="исполнение";}
    :text {label="";}
    :list_box {key="txt-10"; list=""; width=16; height=10;}//list_box
  }//column

  :column {
    :text {label="Диаметр";}
    :text {label="термобаллона";}
    :text {label="";}
    :list_box {key="txt-11"; list=""; width=3; height=10;}//list_box
  }//column

  :column {
    :text {label="НСХ";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-12"; list=""; width=7; height=10;}//list_box
  }//column

  :column {
    :text {label="Кабельный";}
    :text {label="ввод";}
    :text {label="";}
    :list_box {key="txt-13"; list=""; width=7; height=10;}//list_box
  }//column

}//row

:row {label="";
	:column {
		:text {label="";}
  	:text {label=""; key="ptxt-01"; value="Для измерения температуры жидких и газообразных химически неагрессивных сред, а также агрессивных, не разрушающих материал защитной арматуры";}
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

:row {label="";
	:column {
		:text {label="Выбрано"; }//text
		:list_box {label=""; key="txt-901"; list=""; width=18; height=8; value= "0";}
	}//column
}//row



}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
