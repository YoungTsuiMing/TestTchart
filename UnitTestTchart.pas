unit UnitTestTchart;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VCLTee.TeEngine, Vcl.ExtCtrls,
  VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls, VCLTee.Series, VCLTee.TeeGDIPlus,
  VCLTee.TeeDraw3D, VCLTee.DBChart, VCLTee.BubbleCh;

type
  TForm13 = class(TForm)
    Chart1: TChart;
    Chart2: TChart;
    hrzbrsrsSeries1: THorizBarSeries;
    hrzbrsrsSeries2: THorizBarSeries;
    Chart3: TChart;
    btn1: TButton;
    btn_add: TButton;
    btn_addLine: TButton;
    mmo1: TMemo;
    fstlnsrsSeries1: TFastLineSeries;
    procedure btn1Click(Sender: TObject);
    procedure btn_addClick(Sender: TObject);
    procedure btn_addLineClick(Sender: TObject);
    procedure Chart3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.btn1Click(Sender: TObject);
var
  Series: TLineSeries;
begin
  Series := TLineSeries.Create(Chart1);
  Series.Add(100, '头部', clRed);
  Series.Add(200, '颈部', clGreen);
  Chart1.AddSeries(Series);
end;

procedure TForm13.btn_addClick(Sender: TObject);
var
  Series: TChartSeries;
  i: Integer;
begin
  Series := THorizBarSeries.Create(Chart2);
  for i := 1 to 24 do
  begin

    Series.Add(i, '', clRed);
  end;

  Chart2.AddSeries(Series);    //有这个才能显示
end;

procedure TForm13.btn_addLineClick(Sender: TObject);
var
  series1: TLineSeries;
  series2: TLineSeries;
  series3: TLineSeries;
  series4: TLineSeries;
  i: Integer;
begin
  Chart3.Title.Text.Text := '图表的标题'; //图表的标题
  //Series := TLineSeries.Create(Chart1);  //画线时

  series1 := TLineSeries.Create(Chart3);
  series2 := TLineSeries.Create(Chart3);
  series3 := TLineSeries.Create(Chart3);
  series4 := TLineSeries.Create(Chart3);
  Chart3.View3D := False;
  //Chart3.BufferedDisplay := true; //双缓冲
  for i := 1 to 24 do
  begin
    series1.AddXY(i, Random(100), IntToStr(i), clBlue);
    series2.AddXY(i, Random(100), IntToStr(i), clRed);
    series3.AddXY(i, Random(100), IntToStr(i), clYellow);
    series4.AddXY(i, Random(100), IntToStr(i), clAqua);
  end;

  Chart3.AddSeries(series1);    //有这个才能显示
  Chart3.AddSeries(series2);    //有这个才能显示
  Chart3.AddSeries(series3);    //有这个才能显示
  Chart3.AddSeries(series4);    //有这个才能显示

  Chart3.Color := clWhite;        //底色
  //Chart3.BackColor := clGreen;     //图表部分的背景色
  Chart3.Gradient.Visible := True;       //渐变的背景色
  //Chart3.Gradient.Direction := gdFromTopLeft;
  //Chart3.Gradient.StartColor := clGreen;
  //Chart3.Gradient.EndColor := clYellow;
  //series.Title := '嘿嘿';
  //Chart3.Series[0].HorizAxis := aBothHorizAxis;
  //Chart3.Series[0].VertAxis := aBothVertAxis;
  //Chart3.BottomAxis.Title.Caption := 'nsgtao';  //底部标题
  Chart3.BottomAxis.Title.Font.Color := clRed;

  Chart3.Foot.Text.Add('图标的说明文字');  //在图表底部显示一些说明文字
end;

procedure TForm13.Chart3MouseMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
var
  TmpX, TmpY: Double;
  Str: string;
begin
  Chart3.Series[0].GetCursorValues(TmpX, TmpY);
  Str := Format('数值: %s', [FormatFloat('0.00', TmpY)]);
  mmo1.Lines.Add(str);
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
  Self.btn_addLineClick(Sender);
end;

end.

