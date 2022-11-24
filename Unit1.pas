unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, jpeg, pngimage;

type
  TDominosFeeding = class(TForm)
    pagecontrol: TPageControl;
    Home: TTabSheet;
    signup: TTabSheet;
    tbsdowork: TTabSheet;
    btnsignuptabmove: TButton;
    Admin: TTabSheet;
    redLog: TRichEdit;
    lbladmintab: TLabel;
    edtpassword: TEdit;
    btnlogin: TButton;
    btnlogout: TButton;
    btnclear: TButton;
    edtname: TEdit;
    edtnumber: TEdit;
    edtsurname: TEdit;
    edtid: TEdit;
    edtemail: TEdit;
    Cobhelphow: TComboBox;
    imgheader1: TImage;
    lbltitle: TLabel;
    lblwelcome: TLabel;
    Imgbackground: TImage;
    lbldidyouknow: TLabel;
    lblinfo1: TLabel;
    lblinfo2: TLabel;
    lblwhoarewe: TLabel;
    imgchild1: TImage;
    imgchild2: TImage;
    imgheader2: TImage;
    btnfinalize: TButton;
    imgheader3: TImage;
    lblcontactus: TLabel;
    signuptablbl: TLabel;
    lblname: TLabel;
    lblsurname: TLabel;
    lblid: TLabel;
    lblemail: TLabel;
    lblnumber: TLabel;
    lblhelphow: TLabel;
    imgqr: TImage;
    lbldurbanoffices: TLabel;
    lblcapetownoffices: TLabel;
    lbldadress: TLabel;
    lbldphone: TLabel;
    lbldfax: TLabel;
    lbldadmin: TLabel;
    lbldvolenteers: TLabel;
    lblddonors: TLabel;
    lblamanzimtotioffices: TLabel;
    lblaphone: TLabel;
    lblcadress: TLabel;
    lblaadim: TLabel;
    lblaadress: TLabel;
    lblcadim: TLabel;
    lblcphone: TLabel;
    lblformoreinfo: TLabel;
    lblscancode: TLabel;
    lblsaplease: TLabel;
    btnload: TButton;
    lblwebsite: TLabel;
    lblinfo: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnloginClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnlogoutClick(Sender: TObject);
    procedure btneraseClick(Sender: TObject);
    procedure btnfinalizeClick(Sender: TObject);
    procedure btnsignuptabmoveClick(Sender: TObject);
    procedure btnloadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DominosFeeding: TDominosFeeding;
  const
  cpassword = 'admin' ;


implementation

{$R *.dfm}


procedure TDominosFeeding.btnsignuptabmoveClick(Sender: TObject);
begin
pagecontrol.activepage := signup;
end;


procedure TDominosFeeding.btneraseClick(Sender: TObject);
var
logfile : textfile;
sinpassword : string;
iwrong, itry : integer;
begin
// valedating users authentcity
// reciving password
sinpassword := inputbox('Delete','This will erase all data... Please enter password','');
 // checking password
if not (sinpassword = cpassword) then begin
//if incorrext rejecting erease procedure and loging out
showmessage('Password incorrect, logged out');
btnlogout.click;
exit;
end ;
//if correct, checking if file exists and if not the warning user
if not fileexists('logfile.txt') then
 begin
 redlog.Lines.Add('File not found :(');
 redlog.Lines.Add('Can not erase!');
 exit;
end;
// if password is correct and file exists, clear redlog and log file
 assignfile(logfile,'logfile.txt');
 rewrite(logfile);
 redlog.Clear;
 closefile(logfile);
end;


procedure TDominosFeeding.btnfinalizeClick(Sender: TObject);
var
logfile : textfile;
sname, surname, semail, sid, snumber, sfullname, shelp, sline : string;
sdate, stime : string;
bname, bsurname, bemail ,bid ,bnumber , bhelp : boolean;
begin
edtname.Color := clwindow;
 edtsurname.Color := clwindow;
 edtid.Color := clwindow;
 edtemail.Color := clwindow;
 edtnumber.Color := clwindow;
 bid := false;
 bnumber := false;
 bsurname := false;
 bname := false;
 bemail := false;


//Checking inputs
if length(edtname.Text) >= 1 then
 bname := true
else begin
edtname.Color := clred ;
exit;
end;

if length(edtsurname.Text) >= 1 then
begin
bsurname := true ;
end
else
 begin
edtsurname.Color := clred ;
exit;
end;

if (length(edtemail.Text) >= 1) then
begin
bemail := true;
end
else
 begin
edtsurname.Color := clred ;
edtnumber.Color := clred;
 exit;
end;

if length(edtnumber.Text)= 10 then
bnumber := true
else
begin
  edtnumber.Color := clred;
  exit;
end;

if length(edtid.Text) = 13 then
bid := true
else
 begin
edtsurname.Color := clred ;
 exit;
end;

if
(bid = true)
and (bemail = true)
or (bnumber = true)
 and (bname = true)
 and (bsurname = true)
  then
 else
 begin
 showmessage('Information if inadicuit');
 exit;
 end;


//colleting information
sline := '-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------';
sdate := datetostr(date);
stime := timetostr(time);
name := edtname.Text;
surname := edtsurname.Text;
semail := edtemail.Text;
sid := edtid.Text;
snumber := edtnumber.Text;
sdate:=('Date: '+sdate);
stime:=('Time: ' + stime);
sfullname:=('Full Name: '+ name + ' '+ surname);
sid:=('SA ID: '+ sid);
semail:=('Email: ' + semail);
snumber:=('Phone Number: '+  snumber);
shelp:=('Helping with: ' + cobhelphow.Text);
  edtname.Clear;
  edtsurname.Clear;
  edtemail.Clear;
  edtid.Clear;
  edtnumber.Clear;
 //checking if file exists and if not creating a new one
if not fileexists('logfile.txt') then
    begin
      assignfile(logfile,'logfile.txt');
      rewrite(logfile);
      closefile(logfile);
    end ;
//writing to log file
assignfile(logfile,'logfile.txt');
append(logfile);
writeln(logfile,sdate);
writeln(logfile,stime);
writeln(logfile,sfullname);
writeln(logfile,sid);
writeln(logfile,semail);
writeln(logfile,snumber);
writeln(logfile,shelp);
writeln(logfile,sline);
closefile(logfile);
 showmessage('Your all done!' + ' We will be in contact soon');
 pagecontrol.ActivePage :=  home;
 cobhelphow.ItemIndex := -1;
end;


procedure TDominosFeeding.FormActivate(Sender: TObject);
begin
//making sure admin account is secure from activation
redlog.Visible := false;
btnclear.Enabled := false;
btnlogout.Enabled := false;
btnload.Enabled := false;
//other user improvemnts
redlog.ReadOnly := true;
end;


procedure TDominosFeeding.btnloadClick(Sender: TObject);
var
logfile : textfile;
sload : string;
begin
//checking if file exists and warning is it doesnt
if not fileexists('logfile.txt') then begin
redlog.Lines.Add('File not found :(') ;
redlog.Lines.Add('Can not load!');
exit;
end;
//reading from log file
 redlog.Clear;
 assignfile(logfile,'logfile.txt');
 reset(logfile);
 while not eof(logfile) do
 begin
   readln(logfile,sload);
   //adding to redlog to display information in the log file
   redlog.Lines.Add(sload);
 end;
 closefile(logfile);
end;


procedure TDominosFeeding.btnloginClick(Sender: TObject);
begin
//validating users authenticity
if edtpassword.text = cpassword then
begin
//enabeling admin tab
edtpassword.clear;
btnlogin.enabled := false;
btnlogout.Enabled := true;
redlog.Visible := true;
btnclear.Enabled := true;
btnload.Enabled := true;
end
else
// if password is incorrect, waring the user and rejecting access
showmessage('Incorrect password, please try again');
end ;


procedure TDominosFeeding.btnlogoutClick(Sender: TObject);
begin
// log out procedure
btnlogin.Enabled := true;
btnlogout.Enabled := false;
redlog.Visible := false;
btnclear.Enabled := false;
btnload.Enabled:= false;
redlog.Clear;

end;

end.
