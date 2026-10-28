///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_cable_glands_01_general: dialog {label = "Сальники кабельные";

:row {label="";
  :column {label="";
    :text {label="Обозначение";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=34; height=18; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Артикул";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=12; height=18; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Тип";}
    :text {label="крепления";}
    :list_box {key="txt-03"; list=""; width=12; height=18; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Резьба";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=10; height=18; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Диаметр";}
    :text {label="кабеля, мм";}
    :list_box {key="txt-05"; list=""; width=10; height=18; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Материал";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=12; height=18; value=0;}//list_box
  }//column  

  :column {label="";
    :text {label="Масса,";}
    :text {label="кг";}
    :list_box {key="txt-07"; list=""; width=8; height=18; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Производитель";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; width=14; height=18; value=0;}//list_box
  }//column

	:column {label="";
		:text {label="Выбрано"; }//text
		:text {label="";}
		:list_box {label=""; key="txt-901"; list=""; width=54; height=18; value= "0";}
	}//column

}//row

:row {label="";
	:list_box {key="txt-900"; list="";height=5; value=0;}//list_box
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="ЧРО"; key="but3"; height=1;}
	:button {label="СПЦФ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вниз"; key="but6"; height=1;}
	:button {label="Вверх"; key="but7"; height=1;}
	ok_only;
}//row
}

///////////////////////////////////////////////////////////////////////////////////////////////////////////
