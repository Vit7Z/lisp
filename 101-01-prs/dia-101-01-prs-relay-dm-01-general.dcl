///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_press_relay_dm_manotom: dialog {label = "ЭКМ ДМ, Манотомь";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=15; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Климатич.";}
    :text {label="исп.";}
    :list_box {key="txt-02"; list=""; width=18; height=7; value=0;}//list_box
  }//column

  :column {label="";  
  	:text {label="Единицы";}
    :text {label="изм.";}
    :list_box {key="txt-03"; list=""; width=10; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Пределы";}
    :text {label="изм.";}
    :list_box {key="txt-04"; list=""; width=12; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Среда";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=16; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Исп.";}
    :text {label="контактов";}
    :list_box {key="txt-06"; list=""; width=16; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Резьба штуцера";}
    :text {label="";}
    :list_box {key="txt-07"; list=""; width=20; height=7; value=0;}//list_box
  }//column
}//row

:row {label="";
  :column {label="";
    :text {label="Магнитное";}
    :text {label="поджатие";}
    :list_box {key="txt-08"; list=""; width=10; height=6; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Обезжиривание";}
    :text {label="";}
    :list_box {key="txt-09"; list=""; width=15; height=6; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Атомное";}
    :text {label="исп.";}
    :list_box {key="txt-10"; list=""; width=12; height=6; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Черта";}
    :text {label="";}
    :list_box {key="txt-11"; list=""; width=8; height=6; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Экспортное";}
    :text {label="исп.";}
    :list_box {key="txt-12"; list=""; width=15; height=6; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Табличка";}
    :text {label="";}
    :list_box {key="txt-13"; list=""; width=10; height=6; value=0;}
  }//column

  :column {label="";
    :text {label="Отметка о поверке";}
    :text {label="на стекле";}
    :list_box {key="txt-14"; list=""; width=15; height=6; value=0;}
  }//column

  :column {label="";
    :text {label="Поверка";}
    :text {label="";}
    :list_box {key="txt-15"; list=""; width=10; height=6; value=0;}
  }//column
}//row

:row {label="";
  :column {label="";
    :text {label="Описание";}
    :list_box {key="txt-900"; list=""; width=90; height=5; value=0;}//list_box
  }//column
}//row

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="В текст"; key="but6"; height=1;}
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
