dia_101_01_sec_dev_pc_01_general: dialog {label = "АРМ";

:row {label="";
	:column {label="";
		:text {label="Тип оборудования";}
		
		:row {label="";
		  :text {label="Монитор";}
		  :edit_box{label=""; key="txt-01"; edit_width=50; edit_limit=56; value="ASUS VA27DQSB";}
		}//row	
		
		:row {label="";
		  :text {label="Процессор (CPU)";}
		  :edit_box{label=""; key="txt-02"; edit_width=50; edit_limit=56; value="Intel Core i5 10400F";}
		}//row
		
		:row {label="";
		  :text {label="Память (RAM)";}
		  :edit_box{label=""; key="txt-03"; edit_width=50; edit_limit=56; value="DDR4 16ГБ";}
		}//row
		
		:row {label="";
		  :text {label="Жесткий диск (HDD)";}
		  :edit_box{label=""; key="txt-04"; edit_width=50; edit_limit=56; value="240ГБ (SSD)";}
		}//row
		
		:row {label="";
		  :text {label="Видеокарта";}
		  :edit_box{label=""; key="txt-05"; edit_width=50; edit_limit=56; value="NVIDIA GeForce GT1030";}
		}//row
		
		:row {label="";
		  :text {label="Клавиатура, мышь";}
		  :edit_box{label=""; key="txt-06"; edit_width=50; edit_limit=56; value="";}
		}//row
	}//column
	
	:column {label="";
	  :text {label="Дополнительно";}
	  
		:row {label="";
		  //:text {label="Жесткий диск (HDD)";}
		  :toggle{label="Жесткий диск (HDD)"; key="tgl-01"; value="0";}
		  :edit_box{label=""; key="txt-07"; edit_width=50; edit_limit=56; value="KC600 SKC600/256G"; is_enabled=falshe;}
		}//row
	
		:row {label="";
		  //:text {label="Сетевая карта";}
		  :toggle{label="Сетевая карта"; key="tgl-02"; value="0";}
		  :edit_box{label=""; key="txt-08"; edit_width=50; edit_limit=56; value="TG-3468 PCI Express"; is_enabled=falshe;}
		}//row
		
		:row {label="";
		  :text {label="";}
		}//row
		
		:row {label="";
		  :text {label="";}
		}//row
		
		:row {label="";
		  :text {label="";}
		}//row
		
		:row {label="";
		  :text {label="";}
		}//row
		
		:row {label="";
		  :text {label="";}
		}//row
	}//column	
}//row

:row {label="";
	:button {label="СПЦФ"; key="but3"; height=1;}
	ok_only;
}//row

}