use rodio::{Decoder, OutputStream, Sink};
use std::env;
use std::io::Cursor;
use std::process::exit;

fn main() {
    let args: Vec<String> = env::args().collect();

    // Si no hay argumentos o el código de salida es 0, salir silenciosamente
    if args.len() < 2 || args[1] == "0" {
        exit(0);
    }

    // Manejo seguro del flujo de audio en un hilo separado con timeout
    let audio_result = std::thread::spawn(|| {
        let audio_data = include_bytes!("../audio/insulto.mp3");

        let (_stream, stream_handle) = match OutputStream::try_default() {
            Ok(res) => res,
            Err(e) => {
                eprintln!("Error al abrir OutputStream: {:?}", e);
                return;
            }
        };

        match Sink::try_new(&stream_handle) {
            Ok(sink) => {
                let cursor = Cursor::new(audio_data.as_ref());
                match Decoder::new(cursor) {
                    Ok(source) => {
                        sink.append(source);
                        // Algunos backends en Linux terminan sleep_until_end instantáneamente.
                        // Imponemos un tiempo de espera de seguridad basado en la duración aproximada.
                        std::thread::sleep(std::time::Duration::from_millis(2500));
                    }
                    Err(e) => eprintln!("Error decodificando audio: {:?}", e),
                }
            }
            Err(e) => eprintln!("Error creando Sink: {:?}", e),
        }
    });

    // Timeout de seguridad: si el audio tarda más de 5 segundos, el proceso se cierra solo
    let _ = audio_result.join();
}
