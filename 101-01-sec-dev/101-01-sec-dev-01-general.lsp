;/////// ************************************************************ //////////////////////////////////////////////////
;/////// приборы для измерения давления                              ///////////////////////////////////////////////////
;/////// ************************************************************ //////////////////////////////////////////////////
(defun c:101-01-sec-dev-01-general

( / adoc dcl-id list-01 list-02 list-03 list-04 list-05 list-06 list-07 list-08 list-09 type-list-01 type-list-02 
type-list-03 type-list-04 type-list-05 type-list-06 type-list-07 type-list-08)

(setvar "cmdecho" 0)
(setvar "osmode" 6199)
(setvar "textstyle" "standard")

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-01 (list "Элметро, видеорег"
						  			"Regigraf, видеорег"
						  			"РМТ29, видеорег"
						  			"Weintek, панель")
);setq

(setq list-02 (list "2ТРМ1, Овен"
						  			"ТРМ12, Овен"
						  			"ТРМ32, Овен"
						  			"ТРМ202, Овен")
);setq

(setq list-03 (list "Логика"
										));setq
										
										
(setq list-04 (list "Pepperl-Fuchs"
										"Ленпромавтоматика"
										"ЭлеСи"
										"УППО")
);setq

(setq list-05 (list "Moxa")
);setq

										
(setq list-06 (list "Е1842С, измерение тока"
										"ПК"
										"Софт")
);setq

(if (< (setq dcl-id (load_dialog "dia-101-01-sec-dev-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_secondary_device_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)
(list-filling "txt-04" list-04)
(list-filling "txt-05" list-05)
(list-filling "txt-06" list-06)

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



(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)

(cond
	((= type-list-01 "Элметро, видеорег") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-hmi-elmetro-01-general.lsp") (101-01-sec-dev-hmi-elmetro-01-general));=
	((= type-list-01 "Regigraf, видеорег") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-hmi-regigraf-01-general.lsp") (101-01-sec-dev-hmi-regigraf-01-general));=	
	((= type-list-01 "РМТ29, видеорег") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-hmi-rmt-29-01-general.lsp") (101-01-sec-dev-hmi-rmt-29-01-general));=
	((= type-list-01 "Weintek, панель") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-hmi-weintek-01-general.lsp") (101-01-sec-dev-hmi-weintek-01-general));=
);cond

(cond
	((= type-list-02 "2ТРМ1, Овен") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-owen-2trm1.lsp") (101-01-sec-dev-owen-2trm1));=
	((= type-list-02 "ТРМ12, Овен") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-owen-trm12.lsp") (101-01-sec-dev-owen-trm12));=
	((= type-list-02 "ТРМ32, Овен") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-owen-trm32.lsp") (101-01-sec-dev-owen-trm32));=
	((= type-list-02 "ТРМ202, Овен") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-owen-trm202.lsp") (101-01-sec-dev-owen-trm202));=
);cond

(cond
	((= type-list-03 "Логика") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-logika-01-general.lsp") (101-01-sec-dev-logika-01-general));=
);cond

(cond
	((= type-list-04 "Pepperl-Fuchs") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-sft-barrier-pep-fuchs-01-general.lsp") (101-01-sec-dev-sft-barrier-pep-fuchs-01-general));=
	((= type-list-04 "ЭлеСи") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-sft-barrier-elesi-01-general.lsp") (101-01-sec-dev-sft-barrier-elesi-01-general));=
	((= type-list-04 "Ленпромавтоматика") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-sft-barrier-lpa-01-general.lsp") (101-01-sec-dev-sft-barrier-lpa-01-general));=
	((= type-list-04 "УППО") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-sft-barrier-uppo-01-general.lsp") (101-01-sec-dev-sft-barrier-uppo-01-general));=
);cond

(cond
	((= type-list-05 "Moxa") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-net-moxa-01-general.lsp") (101-01-sec-dev-net-moxa-01-general));=
);cond

(cond
	((= type-list-06 "ПК") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-pc-01-general.lsp") (101-01-sec-dev-pc-01-general));=	
	((= type-list-06 "Софт") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-soft-01-general.lsp") (101-01-sec-dev-soft-01-general));=
	((= type-list-06 "Е1842С, измерение тока") (load "d:\\yandexdisk\\my-sprt\\101-01-sec-dev\\101-01-sec-dev-e1842s.lsp") (101-01-secondary-device-e1842s));=
);cond

(vla-endundomark adoc)
(setvar "osmode" 6199)
(setvar "cmdecho" 1)
(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////