///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_elemer_air_30_pd: dialog {label = "Элемер АИР-30 разность давлений";

:row {label="";
	:column {label="";
		:text {label="Исполнение";}
		:text {label="";}
		:popup_list {key="txt-01"; list=""; width=30; height=5;}//popup_list
	}//column

	:column {label="";
		:text {label="Сенсор";}
		:text {label="";}
		:popup_list {key="txt-02"; list=""; width=25; height=5;}//popup_list
	}//column

	:column {label="";
		:text {label="Модель,";}
		:text {label="Диапазон изм.";}
		:popup_list {key="txt-03"; list=""; width=20; height=5;}//popup_list
	}//column

	:column {label="";
		:text {label="Допускаемое";}
		:text {label="Pизб, МПа";}
		:popup_list {label=""; key="txt-04"; list=""; height=5; width=3; value= "";}
	}//column
	
	:column {label="";
		:text {label="Класс";}
		:text {label="безопасности";}
		:popup_list {label=""; key="txt-05"; list=""; height=5; width=3; value= "";}
	}//column	
	
	:column {label="";
		:text {label="Класс";}
		:text {label="точности";}
		:popup_list {label=""; key="txt-06"; list=""; height=5; width=3; value= "";}
	}//column		

	:column {label="";
		:text {label="Климатическое";}
		:text {label="исп.";}
		:popup_list {label=""; key="txt-07"; list=""; height=5; width=3; value= "";}
	}//column
}//row

:spacer {height=1;}

:row {label="";
  :column {label="";
    :text {label="Материал деталей";}
    :popup_list {key="txt-08"; list=""; width=70; height=5;}//list_box
  }//column		

  :column {label="";
    :text {label="Присоединение к процессу";}
    :popup_list {key="txt-09"; list=""; width=115; height=5;}//list_box
  }//column
}//row 

:row {label="";
  :column {label="";
    :text {label="Вых. сигнал";}
    :popup_list {key="txt-10"; list=""; width=10; height=7;}//list_box
  }//column

  :column {label="";
    :text {label="Исполнен. корпуса";}
    :popup_list {key="txt-11"; list=""; width=40; height=7;}//list_box
  }//column

  :column {label="";
    :text {label="Индикация";}
    :popup_list {key="txt-12"; list=""; width=30; height=7;}//list_box
  }//column
}//row


:row {label="";
  :column {label="";
    :text {label="Присоединение изм. цепей";}
    :popup_list {key="txt-13"; list=""; width=80; height=7;}//list_box
  }//column  
}//row

:row {label="";
  :column {label="";
    :text {label="Сигнализация";}
    :popup_list {key="txt-14"; list=""; width=3; height=7;}//list_box
  }//column
}//row

:row {label="";  
  :column {label="";
  	:text {label="Присоединение сигн. цепей";}
    :popup_list {key="txt-15"; list=""; width=50; height=7;}//list_box
  }//column
}//row

  
:row {label="";
  :column {label="";
  	:text {label="Установка клапанного блока и опрессовка";}
    :popup_list {key="txt-16"; list=""; width=60; height=7;}//list_box
  }//column 
}//row


:row {label="";
  :column {label="";
  	:text {label="Монтажный кронштейн";}
    :popup_list {key="txt-17"; list=""; width=25; height=7;}//list_box
  }//column 
}//row

:row {label="";
	:column {label="";
    :text {label="";}
    :toggle {label="List Заводские настройки в соответствии с опросным листом"; key="txt-18"; height=1;}
  }//column

	:column {label="";
  	:text {label="";}
		:toggle {label="360П Стендовые испытания в течение 360 ч"; key="txt-19"; height=1;}
  }//column
  
	:column {label="";
  	:text {label="";}
		:toggle {label="ГП Госповерка"; key="txt-20"; height=1; value="1";}
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
