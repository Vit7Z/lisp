///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_elemer_air_20_m20_pd: dialog {label = "Элемер АИР-20/М2";

:row {label="";
	:column {label="";
		:text {label="Базовое обозначение";}
		:text {label="";}
		:text {label="";}
		:list_box  {key="txt-01"; list=""; width=30; height=7;}//popup_list
	}//column

	:column {label="";
		:text {label="Класс";}
		:text {label="безопасн.";}
		:text {label="(7)";}
		:list_box {key="txt-02"; list=""; width=10; height=7;}
	}//column

	:column {label="";
		:text {label="Маркировка";}
		:text {label="взрывозащ.";}
		:text {label="(8)";}
		:list_box {key="txt-03"; list=""; width=14; height=7;}
	}//column

	:column {label="";
		:text {label="Присоед.";}
		:text {label="к процессу";}
		:text {label="(9)";}
		:list_box {key="txt-04"; list=""; width=12; height=7;}
	}//column

	:column {label="";
		:text {label="Исп. по ";}
		:text {label="материалам";}
		:text {label="(10)";}
		:list_box {key="txt-05"; list=""; width=15; height=7;}
	}//column

	:column {label="";
		:text {label="Код корпуса и";}
		:text {label="индикации";}
		:text {label="(11)";}
		:list_box {key="txt-06"; list=""; width=15; height=7;}
	}//column
	
	:column {label="";
		:text {label="Климатич.";}
		:text {label="исп.";}
		:text {label="(12)";}
		:list_box {key="txt-07"; list=""; width=15; height=7;}
	}//column	
	
	:column {label="";
    :text {label="Класс";}
    :text {label="точности";}
    :text {label="(13)";}
		:list_box {key="txt-08"; list=""; width=10; height=7;}
	}//column	
	
	:column {label="";
    :text {label="Диап.";}
    :text {label="измерений";}
    :text {label="(14)";}
		:list_box {label=""; key="txt-09"; list=""; width=14; height=7; value= "";}
	}//column	

	:column {label="";
    :text {label="Pмакс.";}
    :text {label="для дифф.";}
    :text {label="(15)";}
		:list_box {label=""; key="txt-10"; list=""; width=14; height=7; value= "";}
	}//column	

	:column {label="";
    :text {label="Вых.";}
    :text {label="сигнал";}
    :text {label="(16)";}
		:list_box {label=""; key="txt-11"; list=""; width=10; height=7; value= "";}
	}//column	
}//row


:row {label=""; 
  :column {label="";
    :text {label="Эл.";}
    :text {label="подключение";}
    :text {label="(17)";}
    :list_box {label=""; key="txt-21"; list=""; width=8; height=7; value= "";}
  }//column

  :column {label="";
  	:text {label="Код";}
  	:text {label="полярности";}
    :text {label="(18)";}
    :list_box {label=""; key="txt-22"; list=""; width=8; height=7; value= "";}
  }//column

  :column {label="";
  	:text {label="Степень";}
  	:text {label="защиты";}
    :text {label="(19)";}
    :list_box {label=""; key="txt-23"; list=""; width=8; height=7; value= "";}
  }//column

  :column {label="";
  	:text {label="Брелок";}
  	:text {label="для реле";}
    :text {label="(20)";}
    :list_box {label=""; key="txt-24"; list=""; width=8; height=7; value= "";}
  }//column

  :column {label="";
  	:text {label="HART-";}
  	:text {label="модем";}
    :text {label="(21)";}
    :list_box {label=""; key="txt-25"; list=""; width=10; height=7; value= "";}
  }//column

  :column {label="";
  	:text {label="Кронштейн";}
  	:text {label="";}
    :text {label="(22)";}
    :list_box {label=""; key="txt-26"; list=""; width=10; height=7; value= "";}
  }//column

  :column {label="";
  	:text {label="Компл. монт.";}
  	:text {label="частей";}
    :text {label="(23)";}
    :list_box {label=""; key="txt-27"; list=""; width=10; height=7; value= "";}
  }//column

  :column {label="";
  	:text {label="Клапанный";}
  	:text {label="блок";}
    :text {label="(24)";}
    :list_box {label=""; key="txt-28"; list=""; width=10; height=7; value= "";}
  }//column

  :column {label="";
  	:text {label="Разделитель";}
  	:text {label="сред";}
    :text {label="(25)";}
    :list_box {label=""; key="txt-29"; list=""; width=10; height=7; value= "";}
  }//column

  :column {label="";
  	:text {label="Модуль";}
  	:text {label="грозозащиты";}
    :text {label="(26)";}
    :list_box {label=""; key="txt-30"; list=""; width=10; height=7; value= "";}
  }//column
  
  :column {label="";
  	:text {label="Стендовые";}
  	:text {label="испытания";}
    :text {label="(27)";}
    :list_box {label=""; key="txt-31"; list=""; width=10; height=7; value= "";}
  }//column

	:column {label="";
  	:text {label="Госповерка";}
  	:text {label="";}
    :text {label="(28)";}
    :list_box {label=""; key="txt-32"; list=""; width=10; height=7; value= "";}
  }//column
}//row

:row {label="";
  :column {label="";
    :text {label="Описание";}
    :list_box {key="txt-900"; list=""; width=90; height=7; value=0;}//list_box
  }//column
}//row

:column {label="";
	:text {label="Выбрано";}
	:list_box {label=""; key="txt-901"; list=""; width=22; height=9; value= "0";}
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
