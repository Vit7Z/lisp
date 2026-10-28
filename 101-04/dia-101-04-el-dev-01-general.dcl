dia_101_04_eldev_01_general: dialog {label = "Электроаппараты";

:row {label="";
	:column {label="";
		:text {label="Разное";}
		:text {label="";}
		:list_box {key="txt-01"; list=""; width=22; height=10; value=0;}

	}//column

	:column {label="";
		:text {label="Блоки";}
		:text {label="питания";}
		:list_box {key="txt-02"; list=""; width=15; height=10; value=0;}
	}//column

	:column {label="";
		:text {label="ИБП";}
		:text {label="";}
		:list_box {key="txt-03"; list=""; width=10; height=10; value=0;}
	}//column

	:column {label="";
		:text {label="Кнопки,";}
		:text {label="переключатели";}
		:list_box {key="txt-04"; list=""; width=22; height=10; value=0;}
	}//column

	:column {label="";
		:text {label="Реле";}
		:text {label="";}
		:list_box {key="txt-05"; list=""; width=33; height=10; value=0;}

	}//column

	:column {label="";
		:text {label="Пускатели,";}
		:text {label="контакторы";}
		:list_box {key="txt-06"; list=""; width=17; height=10; value=0;}
	}//column

	:column {label="";
		:text {label="Авт.";}
		:text {label="выключатели";}
		:list_box {key="txt-07"; list=""; width=16; height=10; value=0;}
	}//column

	:column {label="";
		:text {label="Лампы, табло";}
		:text {label="";}
		:list_box {key="txt-08"; list=""; width=23; height=10; value=0;}
	}//column


}//row

:row {label="";
	:column {label="";
		:text {label="ПЧ (ЧРП)";}
		:list_box {key="txt-09"; list=""; width=10; height=10; value=0;}
	}//column
}//row

:row {label="";
	ok_only;
}//row
}

