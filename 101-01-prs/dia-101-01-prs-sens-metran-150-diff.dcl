///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_01_press_sens_metran_150_pd: dialog {label = "Метран-150 разность давлений";

:row {label="";
	:column {label="";
		:text {label="Среда";}
		:popup_list {key="txt-03-0"; list=""; width=20; height=3;}//popup_list
	}//column

	:column {label="";
		:text {label="Диапазон изм., кПа";}
		:row {label="";
			:edit_box {label="Min "; key="txt-03-1"; height=1; width=3; value= "";}
			:edit_box {label="Max"; key="txt-03-2"; height=1; width=3; value= "";}
		}//row
	}//column

	:column {label="";
		:text {label="Рабочее изб. давление, МПа";}
		:edit_box {label=""; key="txt-03-3"; list=""; height=1; width=3; value= "";}
	}//column
	
	:column {label="";
		:text {label="Температура изм. среды, С";}
		:row {label="";
			:edit_box {label="Min "; key="txt-03-4"; list=""; height=1; width=3; value= "+5";}
			:edit_box {label="Max"; key="txt-03-5"; list=""; height=1; width=3; value= "+40";}
		}//row
	}//column

	:column {label="";
		:text {label="Температура окружающей среды, С";}
		:row {label="";
			:edit_box {label="Min "; key="txt-03-6"; list=""; height=1; width=3; value= "+5";}
			:edit_box {label="Max"; key="txt-03-7"; list=""; height=1; width=3; value= "+40";}
		}//row
	}//column
}//row


:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :popup_list {key="txt-02"; list=""; width=16; height=7;}//list_box
    :text {label="";}
    :text {label="";}
  }//column  

  :column {label="";
    :text {label="Пределы изм.,";}
    :text {label="кПа";}
    :popup_list {key="txt-03"; list=""; width=3; height=7;}//list_box
    :text {label="";}
    :text {label="";}
  }//column

  :column {label="";
    :text {label="Pmax изб.,";}
    :text {label="МПа";}
    :popup_list {key="txt-04"; list=""; width=3; height=7;}//list_box
    :text {label="";}
    :text {label="";}
  }//column

  :column {label="";
    :text {label="Материал деталей";}
    :text {label="";}
    :popup_list {key="txt-05"; list=""; width=18; height=7;}//list_box
    :text {label="";}
    :text {label="";}
  }//column

  :column {label="";
    :text {label="Материал";}
    :text {label="мембраны";}
    :popup_list {key="txt-06"; list=""; width=20; height=7;}//list_box
    :text {label="";}
    :text {label="";}
  }//column

  :column {label="";
    :text {label="Уплотнительные";}
    :text {label="кольца";}
    :popup_list {key="txt-07"; list=""; width=3; height=7;}//list_box
    :text {label="";}
    :text {label="";}
  }//column
  
  :column {label="";
    :text {label="Заполняющая";}
    :text {label="жидкость";}
    :popup_list {key="txt-08"; list=""; width=24; height=7;}//list_box
    :text {label="";}
    :text {label="";}
  }//column
  
  :column {label="";
    :text {label="Крепежные";}
    :text {label="детали";}
    :popup_list {key="txt-09"; list=""; width=20; height=7;}//list_box
    :text {label="";}
    :text {label="";}
  }//column

  :column {label="";
    :text {label="Вых. сигнал";}
    :text {label="";}
    :popup_list {key="txt-10"; list=""; width=18; height=4;}//list_box
    :toggle {label="Обратный"; key="txt-10-1"; height=1;}//toggle
    :toggle {label="Квадр. корень"; key="txt-10-2"; height=1;}//toggle
  }//column
}//row

:row {label="";
  :column {label="";
    :text {label="Индикация";}
    :text {label="";}
    :popup_list {key="txt-11"; list=""; width=26; height=7;}//list_box
  }//column  

  :column {label="";
    :text {label="Исп. датчика";}
    :text {label="(взрывозащ.)";}
    :popup_list {key="txt-12"; list=""; width=26; height=7;}//list_box
  }//column  

  :column {label="";
    :text {label="Встроенный";}
    :text {label="клапанный блок";}
    :popup_list {key="txt-13"; list=""; width=3; height=7;}//list_box
  }//column
  
  :column {label="";
  	:text {label="Монтажные части";}
  	:text {label="";}
    :popup_list {key="txt-14"; list=""; width=50; height=7;}//list_box
  }//column

  :column {label="";
  	:text {label="Материал монтажных";}
  	:text {label="частей";}
    :popup_list {key="txt-15"; list=""; width=20; height=7;}//list_box
  }//column 

  :column {label="";
  	:text {label="Фланцы уровня";}
  	:text {label="";}
    :popup_list {key="txt-16"; list=""; width=16; height=7;}//list_box
  }//column 

  :column {label="";
  	:text {label="Монтажный кронштейн";}
  	:text {label="";}
    :popup_list {key="txt-17"; list=""; width=25; height=7;}//list_box
  }//column 
}//row
  
:row {label="";
	:column {label="";
  	:text {label="Спец. опции";}
    :toggle {label="LT -55...+80°С"; key="txt-18-1"; height=1;}
    :toggle {label="Q4 Лист калибровочных данных"; key="txt-18-2"; height=1;}
    :toggle {label="C1 Настройка датчика по заказу потребителя"; key="txt-18-3"; height=1;}
  }//column

	:column {label="";
		:text {label="";}
    :toggle {label="НР Предельное рабочее избыточное давление 40 МПа"; key="txt-18-4"; height=1; is_enabled=falshe;}//toggle
    :toggle {label="PA Основная приведенная погрешность ±0,2%"; key="txt-18-5"; height=1;}//toggle
    :toggle {label="ML Срок службы 20 лет"; key="txt-18-6"; height=1;}//toggle
  }//column
  
	:column {label="";
		:text {label="";}
    :toggle {label="J5 Накладка на среднюю кнопку"; key="txt-18-7"; height=1;}//toggle
    :toggle {label="AR Наработка 360 часов"; key="txt-18-8"; height=1; is_enabled=falshe;}//toggle
    :toggle {label="T1 Защита от импульсных перенапряжений"; key="txt-18-9"; height=1;}//toggle
  }//column
}//row 
  
:row {label=""; height=1;
	:column {label="";
		:text {label="Подключение кабеля";}
		:popup_list {key="txt-19"; list=""; width=95; height=7;}
  }//column
}//row

:row {label="";
	:column {label="";
		:paragraph {
			:text_part {label="150СD - Датчик разности давлений (фланцевого исполнения).";}
			:text_part {label="";}
			:text_part {label="";}
		}//paragraph
	}//column
	
	:column {label="";
		:paragraph {
			:text_part {label="150CDR - Датчик разности давлений (копланарного или фланцевого исполнения).";}
			:text_part {label="";}
			:text_part {label="";}
		}//paragraph
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
