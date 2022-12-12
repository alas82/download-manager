unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, process, urlmon, Forms, Controls, Graphics, Dialogs,
  StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button5: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Process1: TProcess;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);

  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.Button1Click(Sender: TObject);
var
  filename1:string;
begin
     //https://server8.mp3quran.net/ahmad_huth/018.mp3
  filename1:= Edit2.Text;
  Process1.CommandLine:='wget -b -q -o '+ filename1 + ' ' + Edit1.Text; //the link
  Process1.Execute;
  Process1.Free;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  fileload:String;
  begin
    fileload:='curl.exe --output "' + Edit2.Text + '" --url ' + Edit1.Text;
    //ShowMessage(fileload);
  Process1.CommandLine:= fileload;
  Process1.Execute;
  //ShowMessage(Process1.Output.ToString);
  Process1.Free;
end;

procedure TForm1.Button3Click(Sender: TObject);
  var
    filename1:String;

begin
    filename1:= Edit2.Text;
    //ShowMessage(filename1);
     URLDownloadToFile(nil, pchar(Edit1.Text),pchar(filename1), 0, nil);       //link,  file
end;



procedure TForm1.Button5Click(Sender: TObject);
begin
  //SaveDialog1.InitialDir:=Application.Location;
     SaveDialog1.FileName:=ExtractFileName(Edit1.text);  //to load the default filename
  if SaveDialog1.Execute then
     Begin
        //SaveDialog1.de;
        Edit2.Text:= SaveDialog1.FileName;
        Button1.Enabled:=true;
        Button2.Enabled:=true;
        Button3.Enabled:=true;
        SaveDialog1.Free;
     end;


end;


end.

