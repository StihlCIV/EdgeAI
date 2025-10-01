[Markdown Basics](https://docs.github.com/de/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

# Deployment: Ausgangspunkt
[Python Skript: Modellerzeugung](https://bitbucket01.com.stihlgroup.net/projects/VEKI/repos/edge-ai/browse/Jupyter/TempEstim_LA.ipynb)

Verfügbare Formate: `.keras`, `.h5`, `saved_model`, `.tflite`
- `.tflite`: Wahlweise mit oder ohne Quantisierung

# Deployment: TensorFlow-Modell in der **Zuse-Umgebung** bereitstellen und nutzen

1. Ein Modell im SavedModel Format erzeugen
2. [Matlab/Simulink Skripte: Konvertierung von TensorFlow nach .mat](https://bitbucket01.com.stihlgroup.net/projects/VEKI/repos/edge-ai/browse/Matlab/TF) öffnen
3. Dateipfad zum SavedModel definieren und Skript ausführen

Hinweis: Ein TF-Lite Modell kann mithilfe der Matlab/Simulink Skripte im Ordner [TF-Lite](https://bitbucket01.com.stihlgroup.net/projects/VEKI/repos/edge-ai/browse/Matlab/TFLite) in Matlab und Simulink ausgeführt werden

# Deployment: TensorFlow-Modell auf [nRF52840 DK](https://www.nordicsemi.com/Products/Development-hardware/nRF52840-DK)
## Variante 1: Edge Impulse
[Dokumentation - Edge Impulse: Bring your own model (BYOM)]("https://docs.edgeimpulse.com/docs/edge-impulse-studio/bring-your-own-model-byom")
### 1. Vorbereitung 
Plattform: Edge Impulse ([Edge Impulse: Login](https://studio.edgeimpulse.com/login))

1. Mit dem Benutzerkonto anmelden  
2. Ein neues Projekt erstellen (z. B. Temp_Estimation) 
3. Unter Getting started die Option `Upload your model` auswählen  

### 2. Modell-Upload
1. Eine `saved_model.zip` oder `.tflite-Datei` hochladen

    ⚠️ **Wichtig für das SavedModel Format:** \
    Der Ordner des gespeicherten Modells muss in `saved_model` umbenannt, anschließend als `.zip` komprimiert und dann hochgeladen werden!

    [Dokumentation - Edge Impulse: BYOM (Abschnitt: Troubleshooting)](https://docs.edgeimpulse.com/docs/edge-impulse-studio/bring-your-own-model-byom#troubleshooting)

2. Die Modellleistung kann optional für den gewünschten Mikrocontroller berechnet und angezeigt werden  
3.  Auf `Upload file` klicken

### 3. Impulse erzeugen
1. Modelleinstellungen konfigurieren\
    **Optional:**
    - On-device performance berechnen und analysieren
    - Modellverhalten mit Testdaten überprüfen
2. Auf `Save model` klicken
3. Zum Tab "Deployment" des erstellten Impulses wechseln

### 4. Deployment
1. Deployment-Option auswählen
2. Modelloptimierung konfigurieren
3. Auf `Build` klicken

Letzer Schritt: <ins>Modellintegration im nRF Projekt</ins> (siehe unten)

## Variante 2: Edge Impulse Python SDK

[Dokumentation - Edge Impulse: Python SDK mit TensorFlow und Keras](https://docs.edgeimpulse.com/docs/tutorials/ei-python-sdk/python-sdk-with-tf-keras)

Letzer Schritt: <ins>Modellintegration im nRF Projekt</ins> (siehe unten)

## Modellintegration im nRF Projekt
[Dokumenation - Edge Impulse: Wrapper](https://docs.nordicsemi.com/bundle/ncs-2.0.1/page/nrf/libraries/others/ei_wrapper.html)

Letzte Schritte für Variante 1 <ins>und</ins> 2:

1. Den [Edge Impulse: Wrapper (Sample)](https://docs.nordicsemi.com/bundle/ncs-latest/page/nrf/samples/edge_impulse/wrapper/README.html) als Projektvorlage nutzen

    (Hinweis: Wahlweise kann der Wrapper auch in ein bestehendes Projekt integriert werden)

2. Die Anweisungen aus der README.rst der Projektvorlage befolgen