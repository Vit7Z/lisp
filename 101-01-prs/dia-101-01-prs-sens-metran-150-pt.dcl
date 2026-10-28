///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_metran_150_pt: dialog {label = "Метран-150 избыточное давление";

:row {label="";
	:column {label="";
		:text {label="Среда";}
		:popup_list {key="txt-001"; list=""; width=20; height=3;}//popup_list
	}//column

	:column {label="";
		:text {label="Диапазон изм., МПа";}
		:row {label="";
			:edit_box {label="Min "; key="txt-002"; height=1; width=3; value= "";}
			:edit_box {label="Max"; key="txt-003"; height=1; width=3; value= "";}
		}//row
	}//column
	
	:column {label="";
		:text {label="Температура измеряемой среды, С";}
		:row {label="";
			:edit_box {label="Min "; key="txt-004"; list=""; height=1; width=3; value= "+5";}
			:edit_box {label="Max"; key="txt-005"; list=""; height=1; width=3; value= "+40";}
		}//row
	}//column

	:column {label="";
		:text {label="Температура окружающей среды, С";}
		:row {label="";
			:edit_box {label="Min "; key="txt-006"; list=""; height=1; width=3; value= "+5";}
			:edit_box {label="Max"; key="txt-007"; list=""; height=1; width=3; value= "+40";}
		}//row
	}//column
}//row

:row {label="";
  :column {label="";
    :text {label="Модель";}
    :text {label="";}
    :popup_list {key="txt-010"; list=""; width=14; height=7;}
    :text {label="";}
  }//column  

  :column {label="";
    :text {label="Пределы изм.,";}
    :text {label="кПа (МПа)";}
    :popup_list {key="txt-020"; list=""; width=24; height=7;}
    :text {label="";}
  }//column

  :column {label="";
  	:text {label="Технологическое";}
  	:text {label="соединение";}
    :popup_list {key="txt-030"; list=""; width=20; height=7;}
    :text {label="";}
  }//column

  :column {label="";
    :text {label="Мембрана, детали";}
    :text {label="";}
    :popup_list {key="txt-040"; list=""; width=35; height=7;}
    :text {label="";}
  }//column

  :column {label="";
    :text {label="Заполняющая";}
    :text {label="жидкость";}
    :popup_list {key="txt-050"; list=""; width=26; height=7;}
    :text {label="";}
  }//column

  :column {label="";
    :text {label="Выходной";}
    :text {label="сигнал";}
    :popup_list {key="txt-060"; list=""; width=18; height=6;}//list_box
    :toggle {label="Обратный"; key="txt-070"; height=1;}//toggle
  }//column

  :column {label="";
    :text {label="Индикация";}
    :text {label="";}
    :popup_list {key="txt-080"; list=""; width=30; height=7;}//list_box
    :text {label="";}
  }//column 

  :column {label="";
    :text {label="Исп. датчика";}
    :text {label="(взрывозащ.)";}
    :popup_list {key="txt-090"; list=""; width=28; height=7;}//list_box
    :text {label="";}
  }//column
}//row

:row {label="";
  :column {label="";
    :text {label="Встр. клапан. блок";}
    :popup_list {key="txt-100"; list=""; width=10; height=7;}
  }//column

  :column {label="";
  	:text {label="Монтажные части";}
    :popup_list {key="txt-110"; list=""; width=30; height=7;}
  }//column

  :column {label="";
    :text {label="Материал монтажных частей";}
    :popup_list {key="txt-120"; list=""; width=20; height=7;}
  }//column

  :column {label="";
  	:text {label="Монтажный кронштейн";}
    :popup_list {key="txt-130"; list=""; width=20; height=7;}
  }//column
}//row
  
:row {label="";
	:column {label="";
		:text {label="Спец. опции";}
		
		:toggle {label="LT -55...+80°С"; key="txt-140";}//toggle
		
    :toggle {label="Q4 Лист калибровочных данных"; key="txt-150";}//toggle 
    
    :toggle {label="C1 Настройка датчика по заказу потребителя"; key="txt-160";}//toggle
  }//column


	:column {label="";
		:text {label="";}
    :toggle {label="PA Основная приведенная погрешность ±0,2%"; key="txt-170";}//toggle
    
		:toggle {label="ML Срок службы 20 лет"; key="txt-180";}//toggle
		
    :toggle {label="J5 Накладка на среднюю кнопку"; key="txt-190";}//toggle
  }//column

	:column {label="";
		:text {label="";}
    
    :toggle {label="AR Наработка 360 часов"; key="txt-200"; is_enabled=falshe;}//toggle
    
    :toggle {label="T1 Защита от импульсных перенапряжений"; key="txt-210"; is_enabled=falshe;}//toggle
    :text {label="";}
  }//column


}//row 

:row {label=""; height=1;
	:column {label="";
		:text {label="Подключение кабеля";}
		:popup_list {key="txt-220"; list=""; width=95; height=7;}
  }//column
}//row

:row {label="";
	:column {label="";
		:paragraph {
			:text_part {label="150TG - Датчик избыточного давления (штуцерное исполнение).";}
			:text_part {label="";}
		}//paragraph
	}//column
	
	:column {label="";
		:paragraph {
			:text_part {label="";}
			:text_part {label="";}
		}//paragraph
	}//column
}//row

:column {label="";
	:text {label="Выбрано";}
	:list_box {label=""; key="txt-901"; list=""; width=120; height=6; value= "0";}
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
