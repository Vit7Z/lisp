;;; ///////////////////////////////////////////////// оформление перечня элементов ///////////////////////
(defun c:101-08-instparts-01-general

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 type-list-01 type-list-02 type-list-03 type-list-04 type-list-05 type-list-06 type-list-07)

(setvar "cmdecho" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-01 (list "Бобышки, Овен"
						  			"Гильзы, Метран"
						  			"Гильзы, Термико"
						  			"ЗК температуры"));setq
										
(setq list-02 (list "Блок вентильный, Овен"
						  			"Клапанные блоки, Метран"
						 				"Клапанные блоки, Прибор"
						  			"Клапанные блоки, Элемер"
						  			"Переходники"
						  			"Соединения имп. труб"
						  			"Сосуды, Прибор"
						  			"Трубка отводная, Овен"
						  			"ЗК давления"));setq

(setq list-03 (list "Перфоизделия"
										"ИЭК"
										"ДКС S5, лотки металлич."));setq

(setq list-04 (list "Шкафы, ДКС"
										"Шкафы, ИЭК"
										"Шкафы, Тулаавтоматика"
										"Шкафы, Rittal"));setq

(setq list-05 (list "Клеммы Klemsan"
						  			"Наконечник, ИЭК"
										"Шина нулевая, ИЭК"
										"Клеммы Phoenix Contact"));setq

(setq list-06 (list "У614+, соединит." 
										"КЗНС+, соединит."
										"КСПе, соединит."));setq

(setq list-07 (list "Разъемы"
                               "Сальники кабельные")
);setq
										
		
(if (< (setq dcl-id (load_dialog "dia-101-08-instparts-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_08_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)

(action_tile "txt-01"
  (strcat "(setq type-list-01 (nth (atoi (get_tile \"txt-01\")) list-01))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-02"
  (strcat "(setq type-list-02 (nth (atoi (get_tile \"txt-02\")) list-02))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-03"
  (strcat "(setq type-list-03 (nth (atoi (get_tile \"txt-03\")) list-03))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-04"
  (strcat "(setq type-list-04 (nth (atoi (get_tile \"txt-04\")) list-04))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-05"
  (strcat "(setq type-list-05 (nth (atoi (get_tile \"txt-05\")) list-05))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-06"
  (strcat "(setq type-list-06 (nth (atoi (get_tile \"txt-06\")) list-06))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-07"
  (strcat "(setq type-list-07 (nth (atoi (get_tile \"txt-07\")) list-07))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(cond
	((= type-list-01 "Бобышки, Овен") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-owen-lug.lsp") (101-08-owen-lug));=
	((= type-list-01 "Гильзы, Термико") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-sleeve-prtct-termiko.lsp") (101-08-sleeve-prtct-termiko));=
	((= type-list-01 "Гильзы, Метран") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-sleeve-prtct-metran.lsp") (101-08-sleeve-prtct-metran));=
	((= type-list-01 "ЗК температуры") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-mrtg-dsgn-temp.lsp") (101-08-mrtg-dsgn-temp));=
);cond

(cond
	((= type-list-02 "Переходники") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-cnct-pipe-adapter-01-general.lsp") (101-08-cnct-pipe-adapter-01-general));=
	((= type-list-02 "Сосуды, Прибор") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-vessel-condens-pribor.lsp") (101-08-vessel-condens-pribor));=
	((= type-list-02 "Клапанные блоки, Прибор") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-valvate-block-pribor.lsp") (101-08-valvate-block-pribor));=
	((= type-list-02 "Клапанные блоки, Метран") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-valvate-block-metran.lsp") (101-08-valvate-block-metran));=
	((= type-list-02 "Клапанные блоки, Элемер") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-valvate-block-elemer.lsp") (101-08-valvate-block-elemer));=
	((= type-list-02 "Блок вентильный, Овен") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-valvate-block-owen.lsp") (101-08-valvate-block-owen));=
	((= type-list-02 "Трубка отводная, Овен") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-tube-diverter-owen.lsp") (101-08-tube-diverter-owen));=
	((= type-list-02 "Соединения имп. труб") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-cnct-pipe-01-general.lsp") (101-08-cnct-pipe-01-general));=
	((= type-list-02 "ЗК давления") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-mrtg-dsgn-pressure.lsp") (101-08-mrtg-dsgn-pressure));=
);cond

(cond	
	((= type-list-03 "Перфоизделия") (load "d:\\yandexdisk\\my-sprt\\101-08-cbl-dsgn\\101-08-punched.lsp") (101-08-punched));=
	((= type-list-03 "ИЭК") (load "d:\\yandexdisk\\my-sprt\\101-08-cbl-dsgn\\101-08-cbl-dsgn-iek-01-general.lsp") (101-08-cbl-dsgn-iek-01-general));=
	((= type-list-03 "ЧЗЭМИ") (load "d:\\yandexdisk\\my-sprt\\101-08-cbl-dsgn\\101-08-cbl-constr-chzemi-01-general.lsp") (101-08-cbl-constr-chzemi-01-general));=
	((= type-list-03 "ДКС S5, лотки металлич.") (load "d:\\yandexdisk\\my-sprt\\101-08-cbl-dsgn\\101-08-cbl-dsgn-dks-s5-01-general.lsp") (101-08-cbl-dsgn-dks-s5-01-general));=
);cond
						
(cond	
	((= type-list-04 "Шкафы, ДКС") (load "d:\\yandexdisk\\my-sprt\\101-08-m-box-3\\101-08-mtl-cs-dkc-01-general.lsp") (101-08-mtl-cs-dkc-01-general));=
	((= type-list-04 "Шкафы, ИЭК") (load "d:\\yandexdisk\\my-sprt\\101-08-m-box-3\\101-08-mtl-cs-iek-01-general.lsp") (101-08-mtl-cs-iek-01-general));=
	((= type-list-04 "Шкафы, Rittal") (load "d:\\yandexdisk\\my-sprt\\101-08-m-box-2\\101-08-mtl-cs-rittal-01-general.lsp") (101-08-mtl-cs-rittal-01-general));=
	((= type-list-04 "Шкафы, Тулаавтоматика") (load "d:\\yandexdisk\\my-sprt\\101-08-m-box-3\\101-08-mtl-cs-shshm-01-general.lsp") (101-08-mtl-cs-shshm-01-general));=
);cond


(cond
	((= type-list-05 "Клеммы Phoenix Contact") (load "d:\\yandexdisk\\my-sprt\\101-08-clmp\\101-08-clmp-phnix-01-general.lsp") (101-08-clmp-phnix-01-general));=
	((= type-list-05 "Клеммы Klemsan") (load "d:\\yandexdisk\\my-sprt\\101-08-clmp\\101-08-clmp-klemsan-01-general.lsp") (101-08-clmp-klemsan-01-general));=
	((= type-list-05 "Наконечник, ИЭК") (load "d:\\yandexdisk\\my-sprt\\101-08-clmp\\101-08-clmp-iek-cable-tip-01-general.lsp") (101-08-clmp-iek-cable-tip-01-general));=
	((= type-list-05 "Шина нулевая, ИЭК") (load "d:\\yandexdisk\\my-sprt\\101-08-clmp\\101-08-clmp-iek-bus-zero.lsp") (101-08-clmp-iek-bus-zero));=
);cond

(cond
	((= type-list-06 "У614+, соединит.") (load "d:\\yandexdisk\\my-sprt\\101-08-m-box-1\\101-08-mtl-box-u614.lsp") (101-08-mtl-box-u614));=
	((= type-list-06 "КЗНС+, соединит.") (load "d:\\yandexdisk\\my-sprt\\101-08-m-box-1\\101-08-mtl-box-kzns.lsp") (101-08-mtl-box-kzns));=
	((= type-list-06 "КСПе, соединит.") (load "d:\\yandexdisk\\my-sprt\\101-08-m-box-1\\101-08-mtl-box-kspe-01-general.lsp") (101-08-mtl-box-kspe-01-general));=
	
);cond

(cond
	((= type-list-07 "Разъемы") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-cable-connect-01-general.lsp") (101-08-cable-connect-01-general));=
	((= type-list-07 "Сальники кабельные") (load "d:\\yandexdisk\\my-sprt\\101-08\\101-08-cable-glands-01-general.lsp") (101-08-cable-glands-01-general));=
);cond

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////
