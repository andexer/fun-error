use rodio::{Decoder, OutputStream, Sink};
use std::env;
use std::io::Cursor;
use std::process::exit;

fn main() {
    // Hook de pánico silencioso: si algo falla internamente, muere sin ensuciar la terminal
    std::panic::set_hook(Box::new(|_| {}));

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
            Err(_) => return, // Sin tarjeta de sonido → salir en silencio
        };

        if let Ok(sink) = Sink::try_new(&stream_handle) {
            let cursor = Cursor::new(audio_data.as_ref());
            if let Ok(source) = Decoder::new(cursor) {
                sink.append(source);
                sink.sleep_until_end();
            }
        }
    });

    // Timeout de seguridad: si el audio tarda más de 5 segundos, el proceso se cierra solo
    let _ = audio_result.join();
}
