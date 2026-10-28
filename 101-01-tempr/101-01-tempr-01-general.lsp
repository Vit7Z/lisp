;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// приборы для измерения температуры                            ///////////////////////////////////////////////////////////////////////////////////////////////////////////
;/////// ************************************************************ ///////////////////////////////////////////////////////////////////////////////////////////////////////////
(defun c:101-01-tempr-01-general

( / adoc dcl-id list-01 list-02 list-03 type-list-01 type-list-02 type-list-03)

(vl-load-com)
(vla-startundomark (setq adoc (vla-get-activedocument (vlax-get-acad-object))));start undo

(setq list-01 (list "ТБ, Теплоконтроль Каз"
										"ТТЖ"
										"БТ, серия 211"));setq
										
(setq list-02 (list "ТСМУ (ТСПУ), Метран"
										"ТСМ (ТСП), Метран"
										"ДТС (ТС) общепром, Овен"
										"ДТС (4...20) общепром, Овен"
										"ДТС (4...20) Exia, Овен"
										"ДТС (4...20) Exd, Овен"
										"ДТС для воздуха, Овен"
										"ТПУ-205, Элемер"
										"ТМТ-1 (ТПТ-1), Термико"
										"ТС-Б (ТС) общепром, Термопоинт"));setq

(setq list-03 (list "RAK, Sauter"));setq

(if (< (setq dcl-id (load_dialog "dia-101-01-tempr-01-general.dcl")) 0) ;ищем диалог
		(progn
			(alert "Не найден dcl-файл")
			(exit)
		);progn
);if

(if (not (new_dialog "dia_101_01_temp_01_general" dcl-id))
		(exit)
);if

(list-filling "txt-01" list-01)
(list-filling "txt-02" list-02)
(list-filling "txt-03" list-03)

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

(action_tile "accept"
  (strcat "(done_dialog)"
          "(exit)"
  );strcat
);action_tile

(start_dialog)
(unload_dialog dcl-id)


;;;;название файла и программы для датчика должно быть: фирма-модель-общепром или Ех-сигнал(ТС, 4...20)
										
(cond
	((= type-list-01 "ТБ, Теплоконтроль Каз") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr\\101-01-teplokontr-kaz-tb-01-general.lsp") (101-01-teplokontr-kaz-tb-01-general));=
	((= type-list-01 "ТТЖ") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr\\101-01-thermopribor-ttg.lsp") (101-01-thermopribor-ttg));=
	((= type-list-01 "БТ, серия 211") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr\\101-01-tempr-sens-bt-.lsp") (101-01-tempr-sens-ttg));=
);cond

(cond
	((= type-list-02 "ДТС (ТС) общепром, Овен") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr\\101-01-owen-dts-indust-ts-01-general.lsp") (101-01-owen-dts-indust-ts-01-general));=
	((= type-list-02 "ДТС (4...20) общепром, Овен") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr\\101-01-owen-dts-indust-420-01-general.lsp") (101-01-owen-dts-indust-420-01-general));=
	((= type-list-02 "ДТС для воздуха, Овен") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr\\101-01-owen-dts-indust-air-01-general.lsp") (101-01-owen-dts-indust-air-01-general));=
	
	((= type-list-02 "ДТС (4...20) Exia, Овен") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr\\101-01-owen-dts-exia-420-01-general.lsp") (101-01-owen-dts-exia-420-01-general));=
	((= type-list-02 "ДТС (4...20) Exd, Овен") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr\\101-01-owen-dts-exd-420-01-general.lsp") (101-01-owen-dts-exd-420-01-general));=
	
	
	((= type-list-02 "ТСМУ (ТСПУ), Метран") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr\\101-01-tempr-metran-01-tsmu-01-general.lsp") (101-01-tempr-metran-01-tsmu-01-general));=
	((= type-list-02 "ТСМ (ТСП), Метран") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr\\101-01-tempr-metran-01-tsp-01-general.lsp") (101-01-tempr-metran-01-tsp-01-general));=
	
	((= type-list-02 "ТПУ-205, Элемер") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr\\101-01-elemer-tpu-205-indust-01-general.lsp") (101-01-elemer-tpu-205-indust-01-general));=
	
	((= type-list-02 "ТМТ-1 (ТПТ-1), Термико") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr\\101-01-tempr-termiko-tpt-01-general.lsp") (101-01-tempr-termiko-tpt-01-general));=
	
	((= type-list-02 "ТС-Б (ТС) общепром, Термопоинт") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr\\101-01-thermoponit-tsb-indust-01-general.lsp") (101-01-thermoponit-tsb-indust-01-general));=
);cond

(cond
	((= type-list-03 "RAK, Sauter") (load "d:\\yandexdisk\\my-sprt\\101-01-tempr-sens\\101-01-tempr-sens-rak-sauter.lsp") (101-01-tempr-sens-rak-sauter));=

);cond

(setvar "osmode" 6199)
(setvar "cmdecho" 1)

(vla-endundomark adoc)

(gc)
(princ)
)
;;; /////////////////////////////////////////////////////////////// конец программы ///////////////////////////////////////





