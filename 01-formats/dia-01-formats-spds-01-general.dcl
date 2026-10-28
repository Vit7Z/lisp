dia_01_formats_01_general: dialog {label = "Форматы";

:row {label="";
	:column {label="";
		:row {label="";
			:column {label="";
				:text {label="Марка";}
				:text {label="";}
				:list_box {key="txt-011"; list=""; width=9; height=16;}
			}//column
					
			:column {label="";
				:text {label="Индекс";}
				:text {label="";}
				:list_box {key="txt-012"; list=""; width=6; height=16;}
			}//column
		}//row	
		
		:button {label="Создать"; key="but-010"; height=1;}
	}//column

	:column {label="";
		:text {label="Комплекты в Файле";}
		:text {label="";}
		:list_box {key="txt-010"; list=""; width=24; height=16;}	
		:text {label=""; height=1.6;}	
	}//column

	:column {label="";
		:row {label="";
			:column {label="";
				:text {label="А4";}
				:text {label="";}
				:list_box {key="txt-013"; list=""; width=18; height=16;}
			}//column

			:column {label="";
				:text {label="ВхШ, мм";}
				:text {label="";}
				:list_box {key="txt-0131"; list=""; width=12; height=16;}
			}//column
		
			:column {label="";
				:text {label="А3";}
				:text {label="";}
				:list_box {key="txt-014"; list=""; width=18; height=16;}
			}//column

			:column {label="";
				:text {label="ВхШ, мм";}
				:text {label="";}
				:list_box {key="txt-0141"; list=""; width=12; height=16;}
			}//column
		
			:column {label="";
				:text {label="А2";}
				:text {label="";}
				:list_box {key="txt-015"; list=""; width=16; height=16;}
			}//column

			:column {label="";
				:text {label="ВхШ, мм";}
				:text {label="";}
				:list_box {key="txt-0151"; list=""; width=10; height=16;}
			}//column
		
			:column {label="";
				:text {label="А1";}
				:text {label="";}
				:list_box {key="txt-016"; list=""; width=18; height=16;}
			}//column

			:column {label="";
				:text {label="ВхШ, мм";}
				:text {label="";}
				:list_box {key="txt-0161"; list=""; width=10; height=16;}
			}//column
		
			:column {label="";
				:text {label="А0";}
				:text {label="";}
				:list_box {key="txt-017"; list=""; width=18; height=16;}
			}//column

			:column {label="";
				:text {label="ВхШ, мм";}
				:text {label="";}
				:list_box {key="txt-0171"; list=""; width=12; height=16;}
			}//column
		}//row	

		:row {label="";
			:button {label="Без штампа"; key="but-011"; height=1;}
			:button {label="Только штамп 55"; key="but-012"; height=1;}
			:button {label="Только штамп 15"; key="but-013"; height=1;}
			ok_cancel;
			:text {label=""; height=1.6;}
			:text {label=""; height=1.6;}
		}//row
		
	}//column
}//row

}
