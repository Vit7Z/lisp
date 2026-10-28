///////////////////////////////////////////////////////////////////////////////////////////////////////////
dia_101_urg2km: dialog {label = "УРЖ2КМ";

:row {label=""; 
  :column {label=""; 
    :text {label="Модель";}
    :text {label="";}
    :text {label="";}
    :list_box {key="txt-010"; width=12; height=7;}//list_box
  }//column

  :column {label="";
		:row {label="";
			:column {label=""; 
				:text {label="Исполнение";}
				:text {label="по каналам";}
				:text {label="";}
				:list_box {key="txt-020"; width=16; height=7;}
			}//column

			:column {label="";
				:text {label="Соединение";}
				:text {label="";}
				:text {label="";}
    		:list_box {key="txt-030"; width=12; height=7;}//list_box
    	}//column

			:column {label="";
				:text {label="Материал";}
				:text {label="(сталь)";}
    		:text {label="";}
    		:list_box {key="txt-040"; width=24; height=7;}//list_box  
    	}//column

			:column {label="";
				:text {label="Канал 1";}
				:text {label="Диаметр УПР (мм),";}
    		:text {label="пределы изм. (м3/ч)";}
    		:list_box {key="txt-050"; width=20; height=7;}//list_box  
    	}//column
		
			:column {label="";
				:text {label="";}
				:text {label="Длина кабеля,";}
    		:text {label="м";}
    		:edit_box {key="txt-060"; width=4; height=1;}//list_box
    		:text {label=""; height=5;}
    	}//column
		}//row
  }//column  

  :column {label="";
		:row {label="";
			:column {label="";
				:text {label="Канал 2";}
				:text {label="Диаметр УПР (мм),";}
    		:text {label="пределы изм. (м3/ч)";}
    		:list_box {key="txt-090"; width=12; height=7; is_enabled=falshe;}//list_box
    	}//column
		
			:column {label="";
				:text {label="";}
				:text {label="Длина кабеля,";}
    		:text {label="м";}
    		:edit_box {key="txt-100"; width=4; height=1; is_enabled=falshe;}//list_box
    		:text {label=""; height=5;}
    	}//column
		}//row
  }//column  
}//row

:row {label=""; height=1;}

:row {label=""; 
  :column {label=""; 
    :text {label="Поверка";}
    :list_box {key="txt-110"; width=20; height=6;}
  }//column

	:column {label=""; 
  	:text {label="Исполнение ЭБ";}
  	:list_box {key="txt-120"; width=30; height=6;}
  }//column

	:column {label=""; 
		:text {label="Доп. выходы";}
    :list_box {key="txt-130"; width=20; height=6;}
  }//column

	:column {label=""; 
		:text {label="Врезка ПЭП";}
    :list_box {key="txt-140"; width=24; height=6;}
  }//column

	:column {label=""; 
		:text {label="Токовый выход, мА";}
    :list_box {key="txt-150"; width=5; height=6;}
  }//column  

	:column {label=""; 
		:text {label="Спец. опции";}
    :toggle {label="Y Автономное питание"; key="txt-160"; is_enabled=falshe;}
    :toggle {label="Z Усилитель на 6 Дб с гальванической развязкой, встроенный в ПЭП"; key="txt-170";}
  }//column
}//row

:column {label="";
	:text {label="Выбрано";}
	:list_box {key="txt-901"; width=22; height=9;}
}//column

:row {label="";
	:button {label="Запомнить"; key="but1"; height=1;}
	:button {label="ПЭ"; key="but2"; height=1;}
	:button {label="СПЦФ"; key="but3"; height=1;}
	:button {label="ОВШ"; key="but4"; height=1;}
	:button {label="Удалить"; key="but5"; height=1;}
	:button {label="Вверх"; key="but6"; height=1;}
	ok_only;
}//row

}
///////////////////////////////////////////////////////////////////////////////////////////////////////////
