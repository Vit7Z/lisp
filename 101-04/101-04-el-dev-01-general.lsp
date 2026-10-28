;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// электроаппараты                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:101-04-el-dev-01-general

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 type-list-01 type-list-02 type-list-03 type-list-04 type-list-05 type-list-06 
type-list-07 type-list-08 type-list-09)

(setvar "cmdecho" 0)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-01 (list "Микроклимат, ДКС"
										"Микроклимат, Rittal"
										"Овен"
      							"Звонки, сирены"
      							"Резисторы"
      							"Розетки"
										"Щиток освещения, IEK"
										));setq
										
										
;блоки питания
(setq list-02 (list "MeanWell"
										"Omron"
										"Phoenix Contact"
										"Овен"
										"Эмис"));setq
										
(setq list-03 (list "APC"
										"Liebert"
										"Eaton"));setq

;Кнопки, переключатели
(setq list-04 (list "Apator"
										"КЕ, КЭАЗ"
										"ПКЕ, КЭАЗ"
										"Acti 9, Schneider"
										"Harmony XB, Schneider"
										"Harmony K, Schneider"
										));setq

;Реле
(setq list-05 (list "Промежуточное, Релеон"
										"Промежуточное, Finder"
										"Промежуточное, Реле и Автоматика"
										"*Интерфейсное, Релеон" 
										"Контроль фаз, Меандр"
										"Контроль фаз, Schneider"
										"Перегрузки, ABB"
										"Перегрузки, Schneider"));setq

;пускатели, контакторы
(setq list-06 (list "ABB, Контакторы"
										"ИЭК"			
										"Schneider, TeSys"
										"АБС ЗЭИМ, ПБР"
										));setq

(setq list-07 (list "ABB, S200"
										"ABB, MS"
										"ABB, FORMULA"
										"ИЭК"
										"Schneider, Acti 9"
										"Schneider, TeSys"
										"КАЭЗ"));setq
										
;лампы
(setq list-08 (list "ИЭК, ЛПО"
										"ИЭК, ДБО"
										"ДКС, в шкаф"
										"Schneider, XB"
										"СКЛ, Реле и Автоматика"
										"Разное"));setq

;преобразователь частоты
(setq list-09 (list "Siemens V20 3AC"
										"ADT"));setq

(if (< (setq dcl-id (load_dialog "dia-101-04-el-dev-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_04_eldev_01_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)
(list-filling "txt-07" list-07)
(list-filling "txt-08" list-08)
(list-filling "txt-09" list-09)

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

(action_tile "txt-08"
  (strcat "(setq type-list-08 (nth (atoi (get_tile \"txt-08\")) list-08))"
  				"(done_dialog)"
  );strcat
);action_tile

(action_tile "txt-09"
  (strcat "(setq type-list-09 (nth (atoi (get_tile \"txt-09\")) list-09))"
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
	((= type-list-01 "Микроклимат, Rittal") (load "d:\\yandexdisk\\my-sprt\\101-04-rittal\\101-04-rittal-01-general.lsp") (101-04-rittal-01-general));=
	
	((= type-list-01 "Микроклимат, ДКС") (load "d:\\yandexdisk\\my-sprt\\101-04\\101-04-microclim-dkc-01-general.lsp") (101-04-microclim-dkc-01-general));=
	
	((= type-list-01 "Овен") (load "d:\\yandexdisk\\my-sprt\\101-04\\101-04-other-owen.lsp") (101-04-other-owen));=
	
	((= type-list-01 "Звонки, сирены") (load "d:\\yandexdisk\\my-sprt\\101-04\\101-04-bell-general.lsp") (101-04-bell-general));=
	
	((= type-list-01 "Резисторы") (load "d:\\yandexdisk\\my-sprt\\101-04\\101-04-resistors-01-general.lsp") (101-04-resistors-01-general));=
	
	((= type-list-01 "Розетки") (load "d:\\yandexdisk\\my-sprt\\101-04\\101-04-socket-general.lsp") (101-04-socket-general));=
	 
	((= type-list-01 "Щиток освещения, IEK*") (load "d:\\yandexdisk\\my-sprt\\101-04\\101-04-other-iek-case-ochv.lsp") (101-04-other-iek-case-ochv));=
);cond

(cond
	((= type-list-02 "MeanWell") (load "d:\\yandexdisk\\my-sprt\\101-04-pwr-unt\\101-04-pwr-unt-meanwell.lsp") (101-04-pwr-unt-meanwell));=
	
	((= type-list-02 "Omron") (load "d:\\yandexdisk\\my-sprt\\101-04-pwr-unt\\101-04-pwr-unt-omron.lsp") (101-04-pwr-unt-omron));=
	
	((= type-list-02 "Phoenix Contact") (load "d:\\yandexdisk\\my-sprt\\101-04-pwr-unt\\101-04-pwr-unt-phoenix-contact.lsp") (101-04-pwr-unt-phoenix-contact));=
	
	((= type-list-02 "Овен") (load "d:\\yandexdisk\\my-sprt\\101-04-pwr-unt\\101-04-pwr-unt-owen.lsp") (101-04-pwr-unt-owen));=
	
	((= type-list-02 "but-23") (load "d:\\yandexdisk\\my-sprt\\101-04-pwr-unt\\101-04-pwr-unt-elemer.lsp") (101-04-pwr-unt-elemer));=	
	
	((= type-list-02 "but-26") (load "d:\\yandexdisk\\my-sprt\\101-04-pwr-unt\\101-04-pwr-unt-emis-vihr.lsp") (101-04-pwr-unt-emis-vihr));=
);cond

(cond	
	((= type-list-03 "APC") (load "d:\\yandexdisk\\my-sprt\\101-04-pwr-unt\\101-04-ups-apc-01-general.lsp") (101-04-ups-apc-01-general));=
	
	((= type-list-03 "Eaton") (load "d:\\yandexdisk\\my-sprt\\101-04-pwr-unt\\101-04-ups-eaton-01-general.lsp") (101-04-ups-eaton-01-general));=
);cond
	
(cond
	((= type-list-04 "Apator") (load "d:\\yandexdisk\\my-sprt\\101-04-swch\\101-04-swch-apator-01-general.lsp") (101-04-swch-apator-01-general));=
	
	((= type-list-04 "КЕ, КЭАЗ") (load "d:\\yandexdisk\\my-sprt\\101-04-swch\\101-04-swch-keaz-ke-01-general.lsp") (101-04-swch-keaz-ke-01-general));=
	
	((= type-list-04 "ПКЕ, КЭАЗ") (load "d:\\yandexdisk\\my-sprt\\101-04-swch\\101-04-swch-keaz-pke-01-general.lsp") (101-04-swch-keaz-pke-01-general));=
	
	((= type-list-04 "Harmony XB, Schneider") (load "d:\\yandexdisk\\my-sprt\\101-04-swch\\101-04-swtch-harmony.lsp") (101-04-swtch-harmony));=
	
	((= type-list-04 "Acti 9, Schneider") (load "d:\\yandexdisk\\my-sprt\\101-04-swch\\101-04-swtch-acti-9.lsp") (101-04-swtch-acti-9));=
	
	((= type-list-04 "but-45") (load "d:\\yandexdisk\\my-sprt\\101-04-swtch\\101-04-swch-series-k.lsp") (101-04-swtch-series-k));=
);cond
										

(cond	
	((= type-list-05 "Промежуточное, Релеон") (load "d:\\yandexdisk\\my-sprt\\101-04-relay\\101-04-relay-interm-releon-01-general.lsp") (101-04-relay-interm-releon-01-general));=
	
	((= type-list-05 "Промежуточное, Finder") (load "d:\\yandexdisk\\my-sprt\\101-04-relay\\101-04-relay-interm-finder-01-general.lsp") (101-04-relay-interm-finder-01-general));=
	
	((= type-list-05 "Промежуточное, Реле и Автоматика") (load "d:\\yandexdisk\\my-sprt\\101-04-relay\\101-04-relay-interm-relay-and-auto.lsp") (101-04-relay-interm-relay-and-auto));=	
	
	((= type-list-05 "Контроль фаз, Меандр") (load "d:\\yandexdisk\\my-sprt\\101-04-relay\\101-04-relay-control-phase-meandr-01-general.lsp") (101-04-relay-control-phase-meandr-01-general));=
	
	((= type-list-05 "Контроль фаз, Schneider") (load "d:\\yandexdisk\\my-sprt\\101-04-relay\\101-04-relay-control-phase-schneider-el-01-general.lsp") (101-04-relay-control-phase-schneider-el-01-general));=
	
	((= type-list-05 "Перегрузки, ABB") (load "d:\\yandexdisk\\my-sprt\\101-04-relay\\101-04-relay-overload-abb-01-general.lsp") (101-04-relay-overload-abb-01-general));=
	
	((= type-list-05 "Перегрузки, Schneider") (load "d:\\yandexdisk\\my-sprt\\101-04-relay\\101-04-relay-overload-schneider-el-01-general.lsp") (101-04-relay-overload-schneider-el-01-general));=
);cond

(cond
	((= type-list-06 "АБС ЗЭИМ, ПБР") (load "d:\\yandexdisk\\my-sprt\\101-04-contactors\\101-04-contactors-abs-zeim-pbr-01-general.lsp") (101-04-contactors-abs-zeim-pbr-01-general));=
	
	((= type-list-06 "Schneider, TeSys") (load "d:\\yandexdisk\\my-sprt\\101-04-contactors\\101-04-contactors-schn-tesys-01-general.lsp") (101-04-contactors-schn-tesys-01-general));=
	
	((= type-list-06 "ABB, Контакторы") (load "d:\\yandexdisk\\my-sprt\\101-04-contactors\\101-04-contactors-abb-01-general.lsp") (101-04-contactors-abb-01-general));=
	
	((= type-list-06 "ИЭК") (load "d:\\yandexdisk\\my-sprt\\101-04-contactors\\101-04-contactors-iek.lsp") (101-04-contactors-iek));=
);cond

										
(cond	
	((= type-list-07 "ИЭК") (load "d:\\yandexdisk\\my-sprt\\101-04-cir-brk\\101-04-auto-swtch-iek.lsp") (101-04-auto-swtch-iek));=
	
	((= type-list-07 "ABB, S200") (load "d:\\yandexdisk\\my-sprt\\101-04-cir-brk\\101-04-cir-brk-abb-s200-01-general.lsp") (101-04-cir-brk-abb-s200-01-general))
	
	((= type-list-07 "ABB, MS") (load "d:\\yandexdisk\\my-sprt\\101-04-cir-brk\\101-04-cir-brk-abb-ms-01-general.lsp") (101-04-cir-brk-abb-ms-01-general))
	
	((= type-list-07 "ABB, FORMULA") (load "d:\\yandexdisk\\my-sprt\\101-04-cir-brk\\101-04-cir-brk-abb-formula-01-general.lsp") (101-04-cir-brk-abb-formula-01-general))
	
	((= type-list-07 "Schneider, Acti 9") (load "d:\\yandexdisk\\my-sprt\\101-04-cir-brk\\101-04-cir-brk-schn-acti-9-01-general.lsp") (101-04-cir-brk-schn-acti-9-01-general));=
	
	((= type-list-07 "Schneider, TeSys") (load "d:\\yandexdisk\\my-sprt\\101-04-cir-brk\\101-04-cir-brk-schn-brk-tesys-01-general.lsp") (101-04-cir-brk-schn-brk-tesys-01-general));=
	
	((= type-list-07 "but-74") (load "d:\\yandexdisk\\my-sprt\\101-04-cir-brk\\101-04-auto-swtch-keaz.lsp") (101-04-auto-swtch-keaz));=
);cond

(cond
	((= type-list-08 "ИЭК, ЛПО") (load "d:\\yandexdisk\\my-sprt\\101-04-lamp\\101-04-lamp-iek-lpo.lsp") (101-04-lamp-iek-lpo));=
	
	((= type-list-08 "ИЭК, ДБО") (load "d:\\yandexdisk\\my-sprt\\101-04-lamp\\101-04-lamp-iek-dbo.lsp") (101-04-lamp-iek-dbo));=
	
	((= type-list-08 "ДКС, в шкаф") (load "d:\\yandexdisk\\my-sprt\\101-04-lamp\\101-04-lamp-dkc-01-general.lsp") (101-04-lamp-dkc-01-general));=
	
	((= type-list-08 "Schneider, XB") (load "d:\\yandexdisk\\my-sprt\\101-04-lamp\\101-04-lamp-schn-xb-01-general.lsp") (101-04-lamp-schn-xb-01-general));=
	
	((= type-list-08 "СКЛ, Реле и Автоматика") (load "d:\\yandexdisk\\my-sprt\\101-04-lamp\\101-04-lamp-relay-and-auto-skl.lsp") (101-04-lamp-relay-and-auto-skl));=	
	
	((= type-list-08 "Разное") (load "d:\\yandexdisk\\my-sprt\\101-04-lamp\\101-04-lamp-other-general.lsp") (101-04-lamp-other-general));=
);cond

(cond
	((= type-list-09 "Siemens V20 3AC") (load "d:\\yandexdisk\\my-sprt\\101-04\\101-04-vfd-siemens-v20-3ac-01-general.lsp") (101-04-vfd-siemens-v20-3ac-01-general));=
	((= type-list-09 "ADT") (load "d:\\yandexdisk\\my-sprt\\101-04\\101-04-vfd-siemens-01-general.lsp") (101-04-vfd-siemens-01-general));=
);cond

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// КОНЕЦ ПРОГРАММЫ                                              ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// *************************************************************///////////////////////////////////////////////////////////////////////////////////////////////////////////