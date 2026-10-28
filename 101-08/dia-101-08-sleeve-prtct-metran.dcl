///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_08_sleeve_prtct_metran: dialog {label = "Гильзы защитные";

:row {label="";
  :column {label="";
    :text {label="Обозначение";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=10; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Под";}
    :text {label="штуцер";}
    :text {label="";}
    :list_box {key="txt-02"; list=""; width=14; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Резьба";}
    :text {label="монтажн.";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=14; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Резьба";}
    :text {label="внутрен.";}
    :text {label="";}
    :list_box {key="txt-04"; list=""; width=14; height=15; value=0;}//list_box
  }//column

  :column {label="";
  	:text {label="Длина";}
    :text {label="монтажной";}
    :text {label="части, мм.";}
    :list_box {key="txt-05"; list=""; width=10; height=15; value=0;}//list_box
  }//column

  :column {label="";
  	:text {label="Внутр.";}
    :text {label="диаметр";}
    :text {label="штуцера, мм.";}
    :list_box {key="txt-06"; list=""; width=10; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Материал";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-07"; list=""; width=14; height=15; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Давление,";}
    :text {label="МПа";}
    :text {label="";}
    :list_box {key="txt-08"; list=""; width=6; height=15; value=0;}//list_box
  }//column
 
  :column {label="";
    :text {label="Предельная";}
    :text {label="скорость";}
    :text {label="пара, м/с";}
    :list_box {key="txt-09"; list=""; width=10; height=15; value=0; is_enabled=false;}//list_box
  }//column

  :column {label="";
    :text {label="Предельная";}
    :text {label="скорость";}
    :text {label="воды, м/с";}
    :list_box {key="txt-10"; list=""; width=10; height=15; value=0; is_enabled=false;}//list_box
  }//column

  :column {label="";
    :text {label="Масса,";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-99"; list=""; width=10; height=15; value=0;}//list_box
  }//column
}//row

:row {label="";
	:column {label="";
		:text {label="Описание";}
		:list_box {key="txt-1001"; list=""; width=6; height=5; value=0;}//list_box
	}//column
}//row

:column {
	:text {label="Выбрано"; }//text
	:list_box {label=""; key="txt-901"; list=""; width=3; height=8; value= "0";}
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
