///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_press_mp4u: dialog {label = "МП4-У";

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :list_box {key="txt-01"; list=""; width=24; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Климатич.";}
    :text {label="исп.";}
    :list_box {key="txt-02"; list=""; width=15; height=7; value=0;}//list_box
  }//column

  :column {label="";  
  	:text {label="Ед. изм.";}
    :text {label="";}
    :list_box {key="txt-03"; list=""; width=10; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Пределы";}
    :text {label="изм.";}
    :list_box {key="txt-04"; list=""; width=15; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Кл точн.";}
    :text {label="";}
    :list_box {key="txt-05"; list=""; width=10; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Среда";}
    :text {label="";}
    :list_box {key="txt-06"; list=""; width=17; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Конструктивное";}
    :text {label="исп.";}
    :list_box {key="txt-07"; list=""; width=30; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Степень";}
    :text {label="защиты";}
    :list_box {key="txt-08"; list=""; width=15; height=7; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Резьба";}
    :text {label="штуцера";}
    :list_box {key="txt-09"; list=""; width=20; height=7; value=0;}//list_box
  }//column
}//row

:row {label="";
  :column {label="";
    :text {label="Обезжиривание";}
    :text {label="";}
    :list_box {key="txt-10"; list=""; width=15; height=5; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Атомное исп.";}
    :text {label="";}
    :list_box {key="txt-11"; list=""; width=15; height=5; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Демпфер";}
    :text {label="";}
    :list_box {key="txt-12"; list=""; width=8; height=5; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Черта";}
    :text {label="";}
    :list_box {key="txt-13"; list=""; width=8; height=5; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Экспортное";}
    :text {label="исп.";}
    :list_box {key="txt-14"; list=""; width=15; height=5; value=0;}//list_box
  }//column
  
  :column {label="";
    :text {label="Пломба";}
    :text {label="";}
    :list_box {key="txt-15"; list=""; width=8; height=5; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Табличка";}
    :text {label="";}
    :list_box {key="txt-16"; list=""; width=10; height=5; value=0;}
  }//column

  :column {label="";
    :text {label="Номер";}
    :text {label="";}
    :list_box {key="txt-17"; list=""; width=20; height=5; value=0;}//list_box
  }//column

  :column {label="";
    :text {label="Отметка о";}
    :text {label="поверке";}
    :list_box {key="txt-18"; list=""; width=15; height=5; value=0;}
  }//column

  :column {label="";
    :text {label="Поверка";}
    :text {label="";}
    :list_box {key="txt-19"; list=""; width=10; height=5; value=0;}
  }//column
}//row


:row {label="";
	:text {label="* - стандартное исполнение. Диаметр циферблата 160 мм."; key="ptxt-801";}
	:text {label=""; key="ptxt-802";}
}//row


:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
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
