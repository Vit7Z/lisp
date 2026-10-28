///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_thermoponit_ts_b: dialog {label = "Термопоинт";

:row {label="";
  :column {
    :text {label="Модель";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=46; height=14; }//list_box
  }//column  

  :column {
    :text {label="Взрыво-";}
    :text {label="защита";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=8; height=14; }//list_box
  }//column

  :column {
    :text {label="НСХ";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=8; height=14;}//list_box
  }//column

  :column {
    :text {label="Класс";}
    :text {label="допуска";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=10; height=14; }//list_box
  }//column  

  :column {
    :text {label="Схема";}
    :text {label="подкл.";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=10; height=14; }//list_box
  }//column

  :column {
    :text {label="Исп.";}
    :text {label="монтажной";}
    :text {label="части";}
    :list_box {key="txt-06"; list=""; width=12; height=14; }//list_box
  }//column

  :column {
    :text {label="Диапазон";}
    :text {label="измерений,";}
    :text {label="С";}
    :list_box {key="txt-07"; list=""; width=10; height=14; }//list_box
  }//column

  :column {
    :text {label="Lпогр.,";}
    :text {label="мм.";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; width=10; height=14; }//list_box
  }//column
}//row

:row {label="";
  :column {
    :text {label="Диаметр";}
    :text {label="ЧЭ, мм";}
    :text {label="";}
    :list_box {key="txt-09"; list=""; width=8; height=10; }//list_box
  }//column

  :column {
    :text {label="L1";}
    :text {label="ступени,";}
    :text {label="мм";}
    :list_box {key="txt-10"; list=""; width=10; height=10;}//list_box
  }//column

  :column {
    :text {label="Диаметр";}
    :text {label="ступени,";}
    :text {label="мм";}
    :list_box {key="txt-11"; list=""; width=3; height=10;}//list_box
  }//column

  :column {
    :text {label="Тип";}
    :text {label="крепления";}
    :text {label="";}
    :list_box {key="txt-12"; list=""; width=7; height=10;}//list_box
  }//column

  :column {
    :text {label="L";}
    :text {label="наружной";}
    :text {label="части, мм";}
    :list_box {key="txt-13"; list=""; width=7; height=10;}//list_box
  }//column

  :column {
    :text {label="Диаметр";}
    :text {label="наружной";}
    :text {label="части, мм";}
    :list_box {key="txt-14"; list=""; width=7; height=10;}//list_box
  }//column
  
  :column {
    :text {label="Присое-";}
    :text {label="динение";}
    :text {label="";}
    :list_box {key="txt-15"; list=""; width=7; height=10;}//list_box
  }//column  
  
  :column {
    :text {label="Клеммная";}
    :text {label="головка";}
    :text {label="";}
    :list_box {key="txt-16"; list=""; width=7; height=10;}//list_box
  }//column  
  
  :column {
    :text {label="Степень";}
    :text {label="защиты";}
    :text {label="";}
    :list_box {key="txt-17"; list=""; width=7; height=10;}//list_box
  }//column
  
  :column {
    :text {label="Кабельн.";}
    :text {label="ввод";}
    :text {label="";}
    :list_box {key="txt-18"; list=""; width=7; height=10;}//list_box
  }//column  
}//row

:row {label="";
	:column {
		:text {label="";}
  	:text {label=""; key="ptxt-01"; value="Головка Д (большая), с возможность размещения ИП (ТСП -> 4...20мА).";}
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
