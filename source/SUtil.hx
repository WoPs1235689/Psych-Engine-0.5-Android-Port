package;

#if android
import android.AndroidTools;
import android.Permissions;
#end
import lime.app.Application;
import openfl.events.UncaughtErrorEvent;
import openfl.Lib;
import haxe.CallStack.StackItem;
import haxe.CallStack;
import haxe.io.Path;
import sys.FileSystem;
import sys.io.File;

class SUtil
{
    #if android
    private static var aDir:String = null;
    private static var sPath:String = AndroidTools.getExternalStorageDirectory();  
    private static var grantedPermsList:Array<Permissions> = AndroidTools.getGrantedPermissions();  
    #end

    static public function getPath():String
    {
    	#if android
        if (aDir != null && aDir.length > 0) 
        {
            return aDir;
        } 
        else 
        {
            aDir = sPath + "/" + "." + Application.current.meta.get("file") + "/files/";         
        }
        return aDir;
        #else
        return "";
        #end
    }

    static public function doTheCheck()
    {
        #if android
        if (!grantedPermsList.contains(Permissions.READ_EXTERNAL_STORAGE) || !grantedPermsList.contains(Permissions.WRITE_EXTERNAL_STORAGE)) {
            if (AndroidTools.getSDKversion() > 23 || AndroidTools.getSDKversion() == 23) {
                AndroidTools.requestPermissions([Permissions.READ_EXTERNAL_STORAGE, Permissions.WRITE_EXTERNAL_STORAGE]);
            }  
        }

        if (!grantedPermsList.contains(Permissions.READ_EXTERNAL_STORAGE) || !grantedPermsList.contains(Permissions.WRITE_EXTERNAL_STORAGE)) {
            if (AndroidTools.getSDKversion() > 23 || AndroidTools.getSDKversion() == 23) {
                SUtil.applicationAlert("Permisos", "Si no le das los permisos el juego no podra correr y tendras que dar los permisos en ajustes" + "\n" + "Toca Ok para cerrar el juego o continuar");
            } else {
                SUtil.applicationAlert("Permisos", "El juego no puede correr sin el permiso de almacenamiento,porfavor da los permisos en la configuracion del juego" + "\n" + "Toca Ok para cerrar el juego");
            }
        }
        
        if (!FileSystem.exists(sPath + "/" + "." + Application.current.meta.get("file"))){
            FileSystem.createDirectory(sPath + "/" + "." + Application.current.meta.get("file"));
        }

        if (!FileSystem.exists(sPath + "/" + "." + Application.current.meta.get("file") + "/files")){
            FileSystem.createDirectory(sPath + "/" + "." + Application.current.meta.get("file") + "/files");
		#if android
	        AndroidTools.makeToast("Carpeta creada!");
	        #end
        }

	if (!FileSystem.exists(SUtil.getPath() + "log")){
            FileSystem.createDirectory(SUtil.getPath() + "log");
        }

        if (!FileSystem.exists(SUtil.getPath() + "system-saves")){
            FileSystem.createDirectory(SUtil.getPath() + "system-saves");
        }


        if (!FileSystem.exists(SUtil.getPath() + "assets")){
            SUtil.applicationAlert("Instruciones:", "Tienes que copiar assets/assets del apk hacia la carpeta  " + "( aqui " + SUtil.getPath() + " )" + "Si mo tienes Zarchiver, instalalo y activa la opcion de mostrar archivos ocultos en ajustes( en zarchiver toca los 3 puntos,configuracion,administrador de ficheros,mostrar archivos ocultos) para poder ver la carpeta" + "\n" + "Toca ok para cerrar el juego");
	    flash.system.System.exit(0);
        }
        
        if (!FileSystem.exists(SUtil.getPath() + "mods")){
            SUtil.applicationAlert("Instruciones:", "Tienes que copiar assets/mods del apk hacia la carpeta " + "( aqui " + SUtil.getPath() + " )" + " Si no tienes Zarchiver, instalalo y activa la opcion de mostrar archivos ocultos en ajustes( en zarchiver toca los 3 puntos,configuracion,administrador de ficheros,mostrar archivos ocultos) para poder ver la carpeta" + "\n" + "Toca Ok para cerrar el juego");
	    flash.system.System.exit(0);
        }
        #end
    }

    //Thanks Forever Engine
    static public function gameCrashCheck(){
    	Lib.current.loaderInfo.uncaughtErrorEvents.addEventListener(UncaughtErrorEvent.UNCAUGHT_ERROR, onCrash);
    }
     
    static public function onCrash(e:UncaughtErrorEvent):Void {
        var callStack:Array<StackItem> = CallStack.exceptionStack(true);
	var dateNow:String = Date.now().toString();
	dateNow = StringTools.replace(dateNow, " ", "_");
	dateNow = StringTools.replace(dateNow, ":", "'");
	var path:String = "log/" + "crash_" + dateNow + ".txt";

	var errMsg:String = "";

	for (stackItem in callStack)
	{
		switch (stackItem)
		{
			case FilePos(s, file, line, column):
				errMsg += file + " (line " + line + ")\n";
			default:
				Sys.println(stackItem);
		}
	}

        errMsg += e.error;

        if (!FileSystem.exists(SUtil.getPath() + "log")){
            FileSystem.createDirectory(SUtil.getPath() + "log");
        }

        File.saveContent(SUtil.getPath() + path, errMsg + "\n");

	Sys.println(errMsg);
	Sys.println("Crash dump saved in " + Path.normalize(path));
	Sys.println("Making a simple alert ...");
		
	SUtil.applicationAlert("Uncaught Error:", errMsg);
	flash.system.System.exit(0);
    }
	
    public static function applicationAlert(title:String, description:String){
        Application.current.window.alert(description, title);
    }

    static public function saveContent(fileName:String = "file", fileExtension:String = ".json", fileData:String = "you forgot something to add in your code"){
        if (!FileSystem.exists(SUtil.getPath() + "system-saves")){
            FileSystem.createDirectory(SUtil.getPath() + "system-saves");
        }

        sys.io.File.saveContent(SUtil.getPath() + "system-saves" + fileName + fileExtension, fileData);
        #if android
        AndroidTools.makeToast("File Saved Successfully!");
        #end
    }
}
