function hdgui()
  P_MIN = 0.01;
  P_MAX = 0.99;
  P_STEP = [0.01, 0.05];
  P_INIT = 0.5;
  A_MIN = 0.5;
  A_MAX = 0.99;
  A_STEP = [0.01, 0.05];
  A_INIT = 0.8;
  
  ND = -10:10;
  
  function plothd(h, p, a)
    plot(h, ND, arrayfun(@(x)hdif(x, p, a), ND));
  end

  function write_p(p)
    set(hTextP, 'String', sprintf('p = %.2f', p));
  end

  function write_a(a)
    set(hTextA, 'String', sprintf('a = %.2f', a));
  end

  function refresh_plot(h, event, ax)
    p = get(hSliderP, 'Value');
    a = get(hSliderA, 'Value');
    write_p(p);
    write_a(a);
    plothd(hAxes, p, a);
    xlim(hAxes, [ND(1), ND(end)]);
    ylim(hAxes, [0, 0.3]);
    xlabel(hAxes, '#ones - #zeros');
    ylabel(hAxes, 'E[Information gain]');
  end

  hMain = figure('Position', [200, 200, 800, 600], 'Visible', 'off');
  hTextP = uicontrol(hMain, 'Style', 'text',...
    'String', sprintf('p = %.2f', P_INIT),...
    'Units', 'normalized', 'Position', [0.07, 0.93, 0.07, 0.05]);
  hSliderP = uicontrol(hMain, 'Style', 'slider',...
    'Min', P_MIN, 'Max', P_MAX, 'Value', P_INIT, 'SliderStep', P_STEP,...
    'Units', 'normalized', 'Position', [0.15, 0.93, 0.2, 0.05],...
    'Callback', {@refresh_plot});
  hTextA = uicontrol(hMain, 'Style', 'text',...
    'String', sprintf('a = %.2f', A_INIT),...
    'Units', 'normalized', 'Position', [0.65, 0.93, 0.07, 0.05]);
  hSliderA = uicontrol(hMain, 'Style', 'slider',...
    'Min', A_MIN, 'Max', A_MAX, 'Value', A_INIT, 'SliderStep', A_STEP,...
    'Units', 'normalized', 'Position', [0.73, 0.93, 0.2, 0.05],...
    'Callback', {@refresh_plot});
  hAxes = axes('Parent', hMain, 'Position', [0.07, 0.07, 0.86, 0.83]);
  refresh_plot(0, 0, 0);
  set(hMain, 'Visible', 'on');
end