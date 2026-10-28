///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_elemer_air_20_pt: dialog {label = "Элемер АИР-20";

:row {label="";
	:column {label="";
		:text {label="Тип";}
		:text {label="(1)";}
		:list_box  {key="txt-01"; list=""; width=10; height=10;}//popup_list
	}//column

	:column {label="";
		:text {label="Исполнение";}
		:text {label="(2)";}
		:list_box {key="txt-02"; list=""; width=15; height=10;}
	}//column

	:column {label="";
		:text {label="Модиф.";}
		:text {label="(3)";}
		:list_box {key="txt-03"; list=""; width=15; height=10;}
	}//column

	:column {label="";
		:text {label="Кислород";}
		:text {label="(4)";}
		:list_box {key="txt-04"; list=""; width=15; height=10;}
	}//column

	:column {label="";
		:text {label="Давление";}
		:text {label="(5)";}
		:list_box {key="txt-05"; list=""; width=15; height=10;}
	}//column

	:column {label="";
		:text {label="Модель";}
		:text {label="(6)";}
		:list_box {key="txt-06"; list=""; width=15; height=10;}
	}//column
	
	:column {label="";
		:text {label="Класс";}
		:text {label="безопасн. (7)";}
		:list_box {key="txt-07"; list=""; width=15; height=10;}
	}//column	
	
	:column {label="";
		:text {label="Маркировка";}
		:text {label="взрывозащ. (8)";}
		:list_box {key="txt-08"; list=""; width=15; height=10;}
	}//column	
	
	:column {label="";
		:text {label="Присоед.";}
		:text {label="к процессу (9)";}
		:list_box {label=""; key="txt-09"; list=""; width=15; height=10; value= "";}
	}//column	

	:column {label="";
		:text {label="Исп. по материалам";}
		:text {label="(10)";}
		:list_box {label=""; key="txt-04"; list=""; height=10; width=65; value= "";}
	}//column	


	:column {label="";
		:column {label="";
			:text {label="Исп.";}
			:text {label="корпуса (8)";}
			:popup_list {label=""; key="txt-05"; list=""; height=1; width=20; value= "";}
		}//column

		:column {label="";
			:text {label="Климатическое ";}
			:text {label="исполнение (9)";}
			:popup_list {key="txt-06"; list=""; height=1; width=20;}//list_box
		}//column	






		:column {label=""; height=3;}//column	
	}//column
}//row


:row {label=""; 
  :column {label="";
    :text {label="Класс точности";}
    :text {label="(10)";}
    :popup_list {key="txt-07"; list=""; width=10; height=7;}//list_box
  }//column

  :column {label="";
  	:text {label="Эл. подключение";}
  	:text {label="(12)";}
    :popup_list {key="txt-08"; list=""; width=35; height=7;}//list_box
  }//column

  :column {label="";
    :text {label="Длина кабеля для корпуса Н1";}
    :text {label="с разъемом PGM (13)";}
    :edit_box {label=""; key="txt-09"; list=""; width=20; height=1; value= "Нет"; is_enabled=falshe;}
  }//column

  :column {label="";
    :text {label="Герконовое реле,";}
    :text {label="брелок (14)";}
    :popup_list {key="txt-10"; list=""; width=28; height=7;}//list_box
  }//column
}//row


:row {label="";
  :column {label="";
    :text {label="Индикатор (15)";}
    :popup_list {key="txt-11"; list=""; width=20; height=7;}//list_box
  }//column

  :column {label="";
		:text {label="Кабель для подкл. к ПК (16)";}
		:popup_list {key="txt-12"; list=""; width=20; height=7;}//list_box
  }//column

  :column {label="";
  	:text {label="Комплект монтажных частей (17)";}
    :popup_list {key="txt-13"; list=""; width=20; height=7;}//list_box
  }//column

  :column {label="";
  	:text {label="Группа исп. по ЭМС (18)";}
    :popup_list {key="txt-14"; list=""; width=20; height=7;}//list_box
  }//column
}//row

:row {label="";
	:column {label="";
  	:text {label="Стендовые испытания 360 ч (19)";}
		:popup_list {label=""; key="txt-15"; width=20; height=1; value="";}
  }//column
  
	:column {label="";
  	:text {label="Госповерка (20)";}
		:popup_list {label=""; key="txt-16"; width=20; height=1; value="";} 
  }//column
}//row 


:row {label="";
  :column {label="";
    :text {label="Описание";}
    :list_box {key="txt-1001"; list=""; width=90; height=7; value=0;}//list_box
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
